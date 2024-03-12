import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class NoDataUtil extends StatelessWidget {
  const NoDataUtil({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: AppConstants.height_50,
        ),
        Image.asset(
          "assets/images/nothing.png",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: AppConstants.height_10,
        ),
        CustomTextUtil(text1: text),
        const SizedBox(
          height: AppConstants.height_10,
        ),
        Container(
          width: 200,
          child: CustomBtnUtil(
            btnTitle: "Go Back",
            onClicked: () => Get.back(),
          ),
        )
      ],
    );
  }
}
