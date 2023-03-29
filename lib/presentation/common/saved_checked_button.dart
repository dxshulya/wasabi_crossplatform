import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/presentation/common/saved_icon_checked_button.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';

class SavedCheckedButton extends StatelessWidget {
  const SavedCheckedButton({
    Key? key,
    required this.initialChecked,
    required this.alignment,
    required this.onPressed,
  }) : super(key: key);

  final bool initialChecked;
  final Alignment alignment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SavedIconCheckedButton(
      onPressed: onPressed,
      initialChecked: initialChecked,
      foregroundIcon: Icons.favorite_outline_rounded,
      backgroundIcon: Icons.favorite_rounded,
      backgroundColorUnchecked: Colors.transparent,
      backgroundColorChecked: AppColors.brandGreenColor,
      padding: const EdgeInsets.all(16),
      alignment: alignment,
    );
  }
}
