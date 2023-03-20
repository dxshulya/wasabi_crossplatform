import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class ErrorHelper extends StatelessWidget {
  const ErrorHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.locale.common.error),
    );
  }
}
