import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';

class BolitItemUtil extends StatelessWidget {
  const BolitItemUtil({
    super.key,
    this.color = AppColors.blacklight4,
    this.bolitColor = AppColors.brown,
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
  final Color bolitColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bolitColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: size,
              fontFamily: 'Roboto',
              height: heigth,
            ),
          ),
        ),
      ],
    );
  }
}
