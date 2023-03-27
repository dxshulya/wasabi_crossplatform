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
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

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
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      maxLength: 50,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        labelText: context.locale.auth.password,
        hintText: context.locale.auth.password,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: _toggle,
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      onChanged: widget._onPasswordFieldTextChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return context.locale.validation.emptyPattern;
        }
        if (value.length < 7) {
          return context.locale.validation.minSymbolsPattern;
        }
        if (value.length > 50) {
          return context.locale.validation.maxSymbolsPattern;
        }
        return null;
      },
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
