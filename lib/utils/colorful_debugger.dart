import 'package:flutter/material.dart';

enum DebugType { error, info, url, response, statusCode }

prettyPrint(
    {required String tag,
    required dynamic value,
    DebugType type = DebugType.info}) {
  switch (type) {
    case DebugType.statusCode:
      {
        debugPrint('\x1B[33m${"💎 STATUS CODE $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.info:
      {
        debugPrint('\x1B[32m${"⚡ INFO $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.error:
      {
        debugPrint('\x1B[31m${"🚨 ERROR $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.response:
      {
        debugPrint('\x1B[36m${"💡 RESPONSE $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.url:
      {
        debugPrint('\x1B[34m${"📌 URL $tag: $value"}\x1B[0m');
        break;
      }
  }
}

///Использование
/*
prettyPrint(tag: "Profile", value: "200", type: DebugType.statusCode);
prettyPrint(tag: "Profile", value: "Wrong password entered", type: DebugType.error);
prettyPrint(tag: "Profile", value: "google.com", type: DebugType.url);
prettyPrint(tag: "Profile", value: "key_id", type: DebugType.info);
prettyPrint(tag: "Profile", value: "API response", type: DebugType.response);
*/
