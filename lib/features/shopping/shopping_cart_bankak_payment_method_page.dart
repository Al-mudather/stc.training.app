import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/shopping/components/shopping_cart_bottom_sheet_action_component.dart';
import 'package:stc_training/features/shopping/controller/shopping_cart_controller.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ShoppingCartBankakPaymentMethodPage extends StatelessWidget {
  const ShoppingCartBankakPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ShoppingCartController shoppingCartCtl = Get.find<ShoppingCartController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarUtil(barText: "Bankak Payment"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svgs/bankak.svg"),
              CustomTextUtil(
                text1: "Pay throw Bankak",
                fontWeight1: FontWeight.w700,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextUtil(
                text1:
                    "You must type your full name in the payment bill for the bill to be accepted.",
                fontWeight1: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ShoppingCartController>(
                builder: (innerShoppingCartCtl) => Container(
                  // height: 166,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                      ),
                    ],
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: innerShoppingCartCtl.GET_IAMGE_SELECTEION(
                      context: context),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ShoppingCartBottomSheetActionComponent(
        nextStepTitle: "Pay now",
        iconName: Icons.payment,
        goToNextStep: () => {},
      ),
    );
  }
}
