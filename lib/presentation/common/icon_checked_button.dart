import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';

class IconCheckedButton extends StatelessWidget {
  const IconCheckedButton({
    required this.onPressed,
    required this.backgroundIcon,
    required this.foregroundIcon,
    required this.backgroundColorChecked,
    required this.backgroundColorUnchecked,
    required this.initialChecked,
    required this.padding,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  final IconData backgroundIcon;
  final IconData foregroundIcon;

  final Color backgroundColorChecked;
  final Color backgroundColorUnchecked;
  final bool initialChecked;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        side: BorderSide(width: 1.0, color: AppColors.brandRedColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.lightColorSchemeSeed,
      ),
      child: Icon(
        initialChecked ? backgroundIcon : foregroundIcon,
        color:
            initialChecked ? backgroundColorChecked : AppColors.brandRedColor,
      ),
    );
  }
}
