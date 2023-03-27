import 'package:dio/dio.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_message_dto.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.onErrorHandler);

  static const String _unknownStatusName = 'unknown';

  final Function(String, Map<String, dynamic>) onErrorHandler;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorBody = err.response?.data as Map<String, dynamic>;
    final errorBody2 = err.response?.data as Map<String, dynamic>;
    // err.error = FeralfileError.fromJson(errorBody["error"]);
    // err.error = MessageDTO.fromJson(errorBody);
    onErrorHandler(
      errorBody['statusCode'].toString(),
      // err.response?.statusCode?.toString() ?? _unknownStatusName,
      errorBody,
      // err.response?.data.toString() ?? _unknownStatusName,
    );
    handler.next(err);
  }
}
