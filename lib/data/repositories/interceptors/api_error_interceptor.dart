import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.onErrorHandler);

  final Function(String, String, String) onErrorHandler;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorBody = err.response?.data as Map<String, dynamic>;
    onErrorHandler(
      errorBody['statusCode'].toString(),
      errorBody['message'].toString(),
      errorBody['error'].toString(),
    );
    handler.next(err);
  }
}
