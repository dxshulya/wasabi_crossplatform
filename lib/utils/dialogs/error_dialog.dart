import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';

void showErrorDialog(
    {required BuildContext context,
    required String error,
    required String statusCode}) {
  SchedulerBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (_) => ErrorDialog(error: error, statusCode: statusCode),
      ));
}

class ErrorDialog extends StatelessWidget {
  final String? error;
  final String? statusCode;

  const ErrorDialog({required this.error, required this.statusCode, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.lightColorSchemeSeed,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.error, color: Colors.white),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    const Expanded(
                      flex: 1,
                      child: CloseButton(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  statusCode.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(height: 12),
                Text(
                  error.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
