import 'package:flutter/material.dart';
import 'package:stc_training/features/shopping/components/shopping_cart_bottom_sheet_action_component.dart';
import 'package:stc_training/features/shopping/components/shopping_cart_course_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarUtil(barText: "Shopping Cart"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 100),
          child: Wrap(
            runSpacing: 10,
            children: List.generate(
              20,
              (index) => ShoppingCartCourseCardComponent(
                imgPath: "assets/images/boy-avatar.png",
                cardLabel:
                    " ${index}: MRCOG part1 and local OBS and GYNE course",
                amount: "${index}90",
              ),
            ),
          ),
        ),
      ),
      bottomSheet: ShoppingCartBottomSheetActionComponent(
        nextStepTitle: "Next",
        goToNextStep: () => {},
      ),
    );
  }
}
