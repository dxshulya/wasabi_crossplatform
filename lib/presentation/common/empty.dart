import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class EmptyHelper extends StatelessWidget {
  const EmptyHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.locale.common.empty),
    );
  }
}
