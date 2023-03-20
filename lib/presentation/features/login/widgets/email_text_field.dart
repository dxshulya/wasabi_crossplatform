import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
    required String initialText,
    // required void Function(String text) onEmailFieldTextChanged
  })  : _initialText = initialText,
        // _onEmailFieldTextChanged = onEmailFieldTextChanged,
        super(key: key);
  final String _initialText;

  // final void Function(String text) _onEmailFieldTextChanged;

  @override
  State<EmailTextField> createState() => EmailTextFieldState();
}

class EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textController.text = widget._initialText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      maxLines: 1,
      autofocus: false,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorStyle: TextStyle(color: AppColors.brandRedColor),

        labelText: context.locale.auth.email,
        hintText: context.locale.auth.email,
        errorBorder: OutlineInputBorder(),
      ),
      // onChanged: widget._onEmailFieldTextChanged,
    );
  }
}
