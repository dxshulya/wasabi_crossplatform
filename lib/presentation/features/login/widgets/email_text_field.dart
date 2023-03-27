import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
    required void Function(String text) onEmailFieldTextChanged,
  })  : _onEmailFieldTextChanged = onEmailFieldTextChanged,
        super(key: key);

  final void Function(String text) _onEmailFieldTextChanged;

  @override
  State<EmailTextField> createState() => EmailTextFieldState();
}

class EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _textController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 1,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      maxLength: 50,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        labelText: context.locale.auth.email,
        hintText: context.locale.auth.email,
        // labelStyle: TextStyle(
        //   color: _focusNode.hasFocus
        //       ? Colors.grey.shade400
        //       : AppColors.brandGreenColor,
        // ),
        isDense: true,
        contentPadding: const EdgeInsets.all(16.0),
        errorMaxLines: 1,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.brandGreenColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.brandGreenColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.brandRedColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.brandRedColor,
          ),
        ),
        errorStyle: TextStyle(color: AppColors.brandRedColor),
      ),
      onChanged: widget._onEmailFieldTextChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return context.locale.validation.emptyPattern;
        }
        if (!isValidEmail(value)) {
          return context.locale.validation.emailPattern;
        }
        if (value.length > 50) {
          return context.locale.validation.maxSymbolsPattern;
        }
        return null;
      },
    );
  }

  bool isValidEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
