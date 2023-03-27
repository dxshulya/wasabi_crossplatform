import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({
    Key? key,
    required void Function(String text) onNameFieldTextChanged,
  })  : _onNameFieldTextChanged = onNameFieldTextChanged,
        super(key: key);

  final void Function(String text) _onNameFieldTextChanged;

  @override
  State<NameTextField> createState() => NameTextFieldState();
}

class NameTextFieldState extends State<NameTextField> {
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
      keyboardType: TextInputType.text,
      maxLength: 50,
      style: TextStyle(color: AppColors.lightColorSchemeSeed),
      decoration: InputDecoration(
        labelText: context.locale.auth.name,
        hintText: context.locale.auth.name,
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
      onChanged: widget._onNameFieldTextChanged,
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
}
