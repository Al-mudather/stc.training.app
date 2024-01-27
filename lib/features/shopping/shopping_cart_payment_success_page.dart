import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ShoppingCartpaymentSuccessPage extends StatelessWidget {
  const ShoppingCartpaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextUtil(text1: "Congradulations !"),
              // const SizedBox(height: ,),
              CustomTextUtil(
                text1: "Your order is now under process",
                fontWeight1: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 260,
                    child: CustomBtnUtil(
                      btnTitle: "Go to my orders Page",
                      btnColor: AppColors.warrningDark,
                      onClicked: () => {},
                    ),
                  ),
                  Container(
                    width: 260,
                    child: CustomBtnUtil(
                      btnTitle: "Go to main Page",
                      onClicked: () => {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
