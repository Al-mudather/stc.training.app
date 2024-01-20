import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    this.color = Colors.white,
    this.overflow = TextOverflow.ellipsis,
    this.familyName = "somarM",
    this.fontWeight = FontWeight.w400,
    this.size = 0,
    this.softWrap = false,
    this.maxLines = 1,
    required this.text,
    this.textAlign = TextAlign.end,
  });

  FontWeight fontWeight;
  String familyName;
  Color color;
  final String text;
  double size;
  TextOverflow overflow;
  TextAlign textAlign;
  bool softWrap;
  int maxLines;

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
        fontSize: size == 0 ? 26 : size,
        fontFamily: familyName,
      ),
    );
  }
}
