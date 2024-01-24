import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';

class SmallTextUtil extends StatelessWidget {
  const SmallTextUtil({
    super.key,
    this.color = AppColors.blacklight4,
    this.fontWeight = FontWeight.w600,
    this.size = 12,
    this.heigth = 1.2,
    required this.text,
  });

  final Color color;
  final String text;
  final FontWeight fontWeight;
  final double size;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: 'Roboto',
        height: heigth,
      ),
    );
  }
}
