import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
    required void Function(String text) onEmailFieldTextChanged
  })  :_onEmailFieldTextChanged = onEmailFieldTextChanged,
        super(key: key);

  final void Function(String text) _onEmailFieldTextChanged;

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
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      maxLines: 1,
      autofocus: false,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorStyle: TextStyle(color: AppColors.brandRedColor),
        labelText: context.locale.auth.email,
        hintText: context.locale.auth.email,
        errorBorder: const OutlineInputBorder(),
      ),
      onChanged: widget._onEmailFieldTextChanged,
    );
  }
}
