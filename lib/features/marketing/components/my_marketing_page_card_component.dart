import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class MyMarketingPageCardComponent extends StatelessWidget {
  const MyMarketingPageCardComponent({
    super.key,
    required this.imagePath,
    required this.cardLabel,
    required this.btnLabel,
    required this.amount,
  });

  final String imagePath;
  final String cardLabel;
  final String btnLabel;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: AppColors.grey),
            ),
            child: SvgPicture.asset(imagePath),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextUtil(text1: cardLabel),
          const SizedBox(
            height: 5,
          ),
          CustomTextUtil(
            text1: "$amount ",
            hasAnotherText: true,
            text2: "SDG",
            fontSize2: 12,
            fontWeight2: FontWeight.w400,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 145,
            child: CustomBtnUtil(
              btnTitle: btnLabel,
              btnType: BtnTypes.textWithIcon,
              btnColor: AppColors.blacklight2,
              icon: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset("assets/svgs/arrow_white.svg"),
                ),
              ),
              onClicked: () => {},
            ),
          )
        ],
      ),
    );
  }
}
