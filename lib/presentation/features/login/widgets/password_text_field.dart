import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required void Function(String text) onPasswordFieldTextChanged,
    required bool isShowPassword,
    required String initialText,
    required void Function(bool isShow) onIsShowPressed,
  })  : _onPasswordFieldTextChanged = onPasswordFieldTextChanged,
        _isShowPassword = isShowPassword,
        _onIsShowPressed = onIsShowPressed,
        _initialText = initialText,
        super(key: key);

  final void Function(String text) _onPasswordFieldTextChanged;
  final bool _isShowPassword;
  final void Function(bool isShow) _onIsShowPressed;
  final String _initialText;

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // _textController.text = _textController.text = widget._initialText;
    super.initState();
  }

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
      keyboardType: TextInputType.text,
      obscureText: widget._isShowPassword ? false : true,
      maxLength: 50,
      focusNode: _focusNode,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(16.0),
        suffixIcon: widget._isShowPassword
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      // widget._isShowPassword = !widget._isShowPassword;
                    },
                    icon: const Icon(
                      Icons.visibility_rounded,
                      size: 24,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      // widget._isShowPassword = !widget._isShowPassword;
                    },
                    icon: const Icon(
                      Icons.visibility_off_rounded,
                      size: 24,
                    ),
                  ),
                ),
              ),
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
