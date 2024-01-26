import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class WithDrawCardComponent extends StatelessWidget {
  const WithDrawCardComponent({
    super.key,
    required this.cardLabel,
    required this.withdrawDate,
    required this.imgPath,
    required this.amount,
  });

  final String cardLabel;
  final String withdrawDate;
  final String imgPath;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: AppColors.grey),
            ),
            child: SvgPicture.asset(imgPath),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomTextUtil(
            text1: "$cardLabel\n",
            fontSize1: 13,
            fontWeight1: FontWeight.w600,
            hasAnotherText: true,
            text2: withdrawDate,
            fontSize2: 12,
            fontWeight2: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          CustomTextUtil(
            text1: "$amount ",
            fontSize1: 20,
            fontWeight1: FontWeight.w600,
            textColor: AppColors.secondary,
            hasAnotherText: true,
            text2: "USD",
            fontWeight2: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
