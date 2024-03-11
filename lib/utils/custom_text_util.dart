import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';

class CustomTextUtil extends StatelessWidget {
  const CustomTextUtil(
      {super.key,
      required this.text1,
      this.fontSize1 = 16,
      this.fontSize2 = 14,
      this.text2,
      this.identifier = "",
      this.hasAnotherText = false,
      this.textColor = AppColors.blacklight2,
      this.text2Color = AppColors.blacklight2,
      this.fontWeight1 = FontWeight.w900,
      this.fontWeight2 = FontWeight.w900,
      this.textAlign = TextAlign.start,
      this.lineHeight = 1.4,
      this.textOverflow = TextOverflow.visible});

  final String text1;
  final String? text2;
  final String? identifier;
  final Color textColor;
  final Color text2Color;
  final bool hasAnotherText;
  final double fontSize1;
  final double fontSize2;
  final double lineHeight;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      overflow: textOverflow,
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight1,
              fontSize: fontSize1,
              fontFamily: "Inter",
              height: lineHeight,
            ),
          ),
          hasAnotherText
              ? TextSpan(
                  children: [
                    TextSpan(
                      text: text2,
                      style: TextStyle(
                        color: text2Color,
                        fontWeight: fontWeight2,
                        fontSize: fontSize2,
                        fontFamily: "Inter",
                        height: lineHeight,
                      ),
                    ),
                    TextSpan(
                      text: identifier,
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize2,
                        fontFamily: "Inter",
                        height: lineHeight,
                      ),
                    )
                  ],
                )
              : const TextSpan(),
        ],
      ),
    );
  }
}
