import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';

class BaseMessage implements AbstractMessage {
  BaseMessage({
    required String statusCode,
    required String message,
  })  : _statusCode = statusCode,
        _message = message;

  BaseMessage.empty() : this(statusCode: '', message: '');

  @override
  String get statusCode => _statusCode;
  final String _statusCode;

  @override
  String get message => _message;
  final String _message;
}
