import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

void showExitDialog({required BuildContext context}) {
  SchedulerBinding.instance.addPostFrameCallback((_) => showDialog(
    context: context,
    builder: (_) => const ExitDialog(),
  ));
}

class ExitDialog extends StatelessWidget {

  const ExitDialog({Key? key}) : super(key: key);

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
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CloseButton(color: Colors.white),
                  ],
                ),
                const Icon(Icons.question_mark_rounded, color: Colors.white),
                const SizedBox(height: 12),
                Text(
                  context.locale.settings.exitText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}