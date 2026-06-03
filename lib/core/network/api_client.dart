import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
import '../services/secure_storage_service.dart';
import 'api_exception.dart';

class ApiClient {
  late final Dio dio;
  final SecureStorageService _secureStorage = get_x.Get.find<SecureStorageService>();

  ApiClient({String baseUrl = 'https://api.cvmaker.com'}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Token Injection
          final token = await _secureStorage.getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          // Automatic Token Refresh
          if (error.response?.statusCode == 401) {
            final refreshToken = await _secureStorage.getRefreshToken();
            if (refreshToken != null) {
              try {
                // Perform token refresh request
                final refreshResponse = await Dio().post(
                  '$baseUrl/auth/refresh',
                  data: {'refresh_token': refreshToken},
                );
                
                final newToken = refreshResponse.data['token'];
                final newRefreshToken = refreshResponse.data['refresh_token'];
                
                await _secureStorage.saveAuthToken(newToken);
                await _secureStorage.saveRefreshToken(newRefreshToken);
                
                // Retry failed request with new token
                final options = error.requestOptions;
                options.headers['Authorization'] = 'Bearer $newToken';
                
                final retryResponse = await dio.fetch(options);
                return handler.resolve(retryResponse);
              } catch (_) {
                // If refresh fails, clear token and forward error
                await _secureStorage.clearAuthData();
              }
            }
          }
          
          return handler.next(DioException(
            requestOptions: error.requestOptions,
            error: ApiException.fromDioError(error),
            type: error.type,
            response: error.response,
          ));
        },
      ),
    );

    // Logging interceptor in debug mode
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
  }
}
