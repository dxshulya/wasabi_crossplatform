import 'package:dio/dio.dart';
import 'package:wasabi_crossplatform/utils/colorful_debugger.dart';
import 'package:wasabi_crossplatform/utils/datastore/datastore.dart';

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

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseBody = response.data as Map<String, dynamic>;
    if (responseBody['token'] != null) {
      Datastore.setUserToken(responseBody['token'].toString());
      Datastore.setUserName(responseBody['login'].toString());
      prettyPrint(tag: "INTERCEPTOR", value: responseBody, type: DebugType.error);
    }
    handler.next(response);
  }
}
