import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';

class TitleTextUtil extends StatelessWidget {
  const TitleTextUtil({
    super.key,
    required this.firstText,
    this.firstTextColor = AppColors.secondary,
    this.firstTextSize = 16,
    this.secondText = "",
    this.showMarker = true,
  });
  final String firstText;
  final double firstTextSize;
  final Color firstTextColor;
  final String? secondText;
  final bool showMarker;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showMarker
            ? Column(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.brown,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 8,
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              )
            : Container(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: TextStyle(
                  color: firstTextColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: firstTextSize,
                ),
              ),
              TextSpan(
                text: " $secondText",
                style: const TextStyle(
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
