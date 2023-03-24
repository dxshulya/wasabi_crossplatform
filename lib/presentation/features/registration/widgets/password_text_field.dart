import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required void Function(String text) onPasswordFieldTextChanged,
  })  : _onPasswordFieldTextChanged = onPasswordFieldTextChanged,
        super(key: key);

  final void Function(String text) _onPasswordFieldTextChanged;

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
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
      keyboardType: TextInputType.visiblePassword,
      maxLength: 50,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(16.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.brandGreenColor, width: 2.0),
        ),
        errorStyle: TextStyle(color: AppColors.brandRedColor),
        labelText: context.locale.auth.password,
        floatingLabelStyle: TextStyle(color: AppColors.brandGreenColor),
        hintText: context.locale.auth.password,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.brandRedColor, width: 2.0),
        ),
      ),
      onChanged: widget._onPasswordFieldTextChanged,
    );
  }
}
