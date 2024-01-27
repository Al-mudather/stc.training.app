import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ShoppingCartCourseCardComponent extends StatelessWidget {
  const ShoppingCartCourseCardComponent({
    super.key,
    required this.imgPath,
    required this.cardLabel,
    required this.amount,
  });

  final String imgPath;
  final String cardLabel;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 97,
      padding: EdgeInsets.all(9),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _IMAGE_course_card(),
          Expanded(
            child: CustomTextUtil(
              text1: cardLabel,
              fontSize1: 14,
              fontWeight1: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtnUtil(
                btnTitle: "",
                btnType: BtnTypes.icon,
                icon: Icon(
                  Icons.delete,
                  color: AppColors.secondary,
                  size: 25,
                ),
                onClicked: () => {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextUtil(
                text1: "${amount}K ",
                textColor: AppColors.secondary,
                fontSize1: 14,
                fontWeight1: FontWeight.w500,
                hasAnotherText: true,
                text2: "sdg",
                fontSize2: 14,
                fontWeight2: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _IMAGE_course_card() {
    return Container(
      height: 79,
      width: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: AppColors.secondary),
      ),
    );
  }
}
