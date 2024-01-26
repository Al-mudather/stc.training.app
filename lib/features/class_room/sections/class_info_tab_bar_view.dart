import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:stc_training/utils/small_text_util.dart';

class ClassInfoTabBarView extends StatelessWidget {
  const ClassInfoTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TELEGRAM_join_group_btn(),
        const SizedBox(
          height: 10,
        ),
        _CERTIFICATE_issue_btn(),
      ],
    );
  }

  Container _CERTIFICATE_issue_btn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.grey,
          ),
          bottom: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextUtil(
            text1: "Certificate",
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomTextUtil(
              text1: "Download the STC Sertifcate",
              fontSize1: 14,
              fontWeight1: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
          CustomBtnUtil(
            btnTitle: "Request",
            onClicked: () => {},
            btnColor: AppColors.successDark,
          ),
        ],
      ),
    );
  }

  Container _TELEGRAM_join_group_btn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.grey,
          ),
          bottom: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextUtil(
            text1: "Telegram \n",
            hasAnotherText: true,
            text2: "Group",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomTextUtil(
              text1: "Group Link: \n",
              fontSize1: 14,
              fontWeight1: FontWeight.w500,
              hasAnotherText: true,
              text2: "https://t.me/+EzlRI7qMgfgzZDQ0",
              fontSize2: 12,
              fontWeight2: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
          CustomBtnUtil(
            btnTitle: "Join",
            btnType: BtnTypes.eleveatedWithIcon,
            icon: Icon(Icons.telegram_sharp, color: Colors.white),
            onClicked: () => {},
            btnColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
