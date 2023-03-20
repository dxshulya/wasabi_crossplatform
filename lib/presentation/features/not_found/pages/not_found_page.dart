import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(
                color: AppColors.lightColorSchemeSeed,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 6, left: 6),
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.lightColorSchemeSeed,
                ),
              ),
            ),
            Text(
              context.locale.notFound.notFound,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
