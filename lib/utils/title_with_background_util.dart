import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class TitleWithBackgroundUtil extends StatelessWidget {
  const TitleWithBackgroundUtil({
    super.key,
    required this.title,
    this.titleColor = AppColors.dark,
    this.backgroundColor = AppColors.secondary,
    this.fontSize = 20,
  });

  final String title;
  final double fontSize;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // widthFactor: 4,
            child: Transform.translate(
              offset: Offset(-7, 0),
              child: Container(
                height: 10,
                color: backgroundColor.withOpacity(0.9),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomTextUtil(
              text1: title,
              textColor: titleColor,
              fontSize1: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
