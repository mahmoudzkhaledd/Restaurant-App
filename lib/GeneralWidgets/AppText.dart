import 'package:flutter/material.dart';

enum TextLanguage {
  english,
  arabic,
}

class AppText extends StatelessWidget {
  static String get currentFont =>
      defaultLanguage == TextLanguage.arabic ? arabicFont : englishFont;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textScaleFactor,
    this.language,
    this.maxLines, this.overFlow,
  });

  static String arabicFont = "";
  static String englishFont = "";
  static TextLanguage defaultLanguage = TextLanguage.arabic;
  final String text;
  final TextLanguage? language;
  final double? textScaleFactor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overFlow;
  @override
  Widget build(BuildContext context) {
    TextLanguage lang = language ?? defaultLanguage;
    return Text(
      text,
      overflow: overFlow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style == null
          ? TextStyle(
              fontFamily:
                  lang == TextLanguage.arabic ? arabicFont : englishFont,
            )
          : style!.fontFamily == null
              ? style!.copyWith(
                  fontFamily:
                      lang == TextLanguage.arabic ? arabicFont : englishFont,
                )
              : style,
    );
  }
}
