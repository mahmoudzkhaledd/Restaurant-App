import 'package:flutter/material.dart';


import '../Shared/Fonts/CairoFont.dart';
import 'AppText.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.borderd,
    this.backgroundColor = const Color.fromRGBO(44, 85, 125, 1),
    this.textColor = Colors.white,
    this.horizontalPadding,
    this.verticalPadding,
    required this.onTap,
    this.fontSize,
    this.borderWidth,
    this.icon,
  });

  final Widget? icon;
  final String text;
  final bool? borderd;
  final Color backgroundColor;
  final Color textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final VoidCallback onTap;
  final double? fontSize;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: borderd == true
              ? Border.all(
                  width: borderWidth ?? 0,
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20,
          vertical: verticalPadding ?? 10,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily: CairoFont.cairoMedium,
                  fontSize: fontSize,
                ),
              ),
              if (icon != null)
                Row(
                  children: [
                    const SizedBox(width: 10),
                    icon!,
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
