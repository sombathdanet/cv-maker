import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_exception.dart';
import 'api_response.dart';

abstract class BaseApiService {
  final ApiClient client;

  BaseApiService(this.client);

  Future<ApiResponse<T>> safeRequest<T>(Future<Response> Function() request, T Function(dynamic) parser) async {
    try {
      final response = await request();
      final parsedData = parser(response.data);
      return ApiResponse.success(parsedData);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        return ApiResponse.error((e.error as ApiException).message);
      }
      return ApiResponse.error(e.message ?? 'Unknown request error');
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
