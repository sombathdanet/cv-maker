import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  ApiException({required this.message, this.statusCode, this.details});

  factory ApiException.fromDioError(DioException error) {
    String message = 'Unexpected network error occurred';
    int? statusCode = error.response?.statusCode;
    
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timed out. Please try again.';
        break;
      case DioExceptionType.badResponse:
        final data = error.response?.data;
        if (data is Map && data.containsKey('message')) {
          message = data['message'].toString();
        } else {
          message = 'Server error (${error.response?.statusCode})';
        }
        break;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;
      default:
        message = error.message ?? message;
        break;
    }
    return ApiException(message: message, statusCode: statusCode, details: error.response?.data);
  }

  @override
  String toString() => message;
}
