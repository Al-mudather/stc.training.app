import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/small_text_util.dart';

class ExpandableTextUtil extends StatefulWidget {
  const ExpandableTextUtil({
    super.key,
    required this.text,
    this.height = 0,
  });
  final String text;
  final double height;
  @override
  State<ExpandableTextUtil> createState() => _ExpandableTextUtilState();
}

class _ExpandableTextUtilState extends State<ExpandableTextUtil> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 210;

  @override
  void initState() {
    super.initState();
    if (widget.height > 0) {
      textHeight = widget.height;
    }
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallTextUtil(
              text: firstHalf,
              size: 14,
              heigth: 1.8,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallTextUtil(
                  text: hiddenText ? '$firstHalf...' : (firstHalf + secondHalf),
                  size: 14,
                  heigth: 1.8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallTextUtil(
                        text: hiddenText ? "Show more" : 'Show less',
                        color: AppColors.brown,
                        size: 14,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up_outlined,
                        color: AppColors.brown,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
