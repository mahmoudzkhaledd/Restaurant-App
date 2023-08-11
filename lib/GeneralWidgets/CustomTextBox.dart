import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Shared/Fonts/CairoFont.dart';
import 'AppText.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword,
    this.icon,
    this.onChanged,
    this.showEyeIcon,
    this.onChangeVisability,
    this.bordered = false,
    this.initialValue,
    this.title,
    this.errorText,
    this.textAlign,
    this.letterSpacing,
    this.isNumber,
    this.maxLength,
    this.backgroundColor = const Color.fromRGBO(247, 247, 249, 1),
  });

  final String? title;
  final double? letterSpacing;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? bordered;
  final IconData? icon;
  final Function(String)? onChanged;
  final bool? showEyeIcon;
  final VoidCallback? onChangeVisability;
  final String? initialValue;
  final String? errorText;
  final TextAlign? textAlign;
  final bool? isNumber;
  final int? maxLength;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            AppText(
              title!,
              style: const TextStyle(
                fontFamily: CairoFont.cairoMedium,
                fontSize: 15,
              ),
            ),
          if (title != null) const SizedBox(height: 5),
          TextFormField(
            obscureText: isPassword == true,
            onChanged: onChanged,
            initialValue: initialValue,
            keyboardType: isNumber == true ? TextInputType.number : null,
            textAlign: textAlign ?? TextAlign.start,
            inputFormatters: isNumber == true
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            maxLength: maxLength,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              hintText: hintText,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide:
                    bordered == true ? const BorderSide() : BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: errorText,
              suffixIcon: showEyeIcon == true
                  ? IconButton(
                      onPressed: onChangeVisability,
                      icon: Icon(
                        isPassword == false
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 21,
                      ),
                    )
                  : null,
              hintStyle: TextStyle(
                fontSize: 15,
                fontFamily: CairoFont.cairoMedium,
                letterSpacing: letterSpacing,
              ),
              labelStyle: TextStyle(
                fontSize: 15,
                fontFamily: CairoFont.cairoMedium,
                letterSpacing: letterSpacing,
              ),
              fillColor: backgroundColor,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
