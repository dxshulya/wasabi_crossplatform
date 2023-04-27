import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';

class BaseMessage implements AbstractMessage {
  BaseMessage({
    required int statusCode,
    required String message,
  })  : _statusCode = statusCode,
        _message = message;

  BaseMessage.empty() : this(statusCode: 0, message: '');

  @override
  int get statusCode => _statusCode;
  final int _statusCode;

  @override
  String get message => _message;
  final String _message;
}
