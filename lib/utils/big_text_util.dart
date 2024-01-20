import 'package:flutter/material.dart';

class BigTextUtil extends StatelessWidget {
  const BigTextUtil({
    super.key,
    this.color = Colors.white,
    this.overflow = TextOverflow.ellipsis,
    this.familyName = "somarM",
    this.fontWeight = FontWeight.w400,
    this.size = 26,
    this.softWrap = false,
    this.maxLines = 1,
    required this.text,
    this.textAlign = TextAlign.end,
  });

  final FontWeight fontWeight;
  final String familyName;
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final bool softWrap;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        wordSpacing: 1.5,
        letterSpacing: 0.5,
        fontSize: size,
        fontFamily: familyName,
      ),
    );
  }
}
