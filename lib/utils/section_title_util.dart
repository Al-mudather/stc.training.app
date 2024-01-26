import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/title_text_util.dart';

class SectionTitleUtil extends StatelessWidget {
  const SectionTitleUtil({
    super.key,
    this.firstText = "",
    this.firstTextColor = AppColors.secondary,
    this.firstTextSize = 16,
    this.secondText = "",
    this.linkTitle = "",
    this.hasLink = false,
  });

  final Color firstTextColor;
  final double firstTextSize;
  final String firstText;
  final String secondText;
  final String linkTitle;
  final bool hasLink;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTextUtil(
          firstText: "  $firstText",
          firstTextColor: firstTextColor,
          firstTextSize: firstTextSize,
          secondText: secondText,
        ),
        hasLink == true
            ? _LINK_to_another_page(linkTitle: linkTitle)
            : Container(),
      ],
    );
  }

  Row _LINK_to_another_page({required String linkTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigTextUtil(
          text: linkTitle,
          fontSize: 16,
          color: AppColors.brown,
          fontWeight: FontWeight.bold,
        ),
        Transform.rotate(
          angle: 110,
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondary,
          ),
        ),
        Transform.translate(
          offset: const Offset(-20, 0),
          child: Transform.rotate(
            angle: 110,
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
