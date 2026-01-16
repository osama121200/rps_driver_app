import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Map network errors to unified messages or error types if needed
    super.onError(err, handler);
  }
}

