import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.horizontalPadding,
    this.verticalPadding,
    required this.onTap,
    this.backColor,
    this.bordered,
  });

  final bool? bordered;
  final VoidCallback onTap;
  final IconData icon;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backColor ?? Colors.white,
          border: bordered == true
              ? Border.all(
                  width: 2,
                  color: Colors.black,
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20,
          vertical: verticalPadding ?? 20,
        ),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
