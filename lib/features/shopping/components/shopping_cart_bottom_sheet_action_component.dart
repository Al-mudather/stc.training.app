import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ShoppingCartBottomSheetActionComponent extends StatelessWidget {
  const ShoppingCartBottomSheetActionComponent({
    super.key,
    required this.nextStepTitle,
    this.goToNextStep,
  });

  final String nextStepTitle;
  final VoidCallback? goToNextStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _totalAmount(),
          _nexStepAction(),
        ],
      ),
    );
  }

  Column _totalAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            const Icon(
              Icons.text_snippet,
              color: AppColors.blacklight4,
            ),
            const SizedBox(
              width: 5,
            ),
            CustomTextUtil(
              text1: "Total amount",
              // fontSize1: 24,
              textColor: AppColors.blacklight4,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextUtil(
          text1: "77,000,00.00 ",
          fontSize1: 18,
          textColor: AppColors.secondary,
          hasAnotherText: true,
          text2: "sdg",
          fontSize2: 14,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Container _nexStepAction() {
    return Container(
      height: 72,
      width: 171,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      ),
      child: Transform.translate(
        offset: const Offset(0, 5),
        child: SizedBox(
          height: 40,
          child: CustomBtnUtil(
            btnTitle: nextStepTitle,
            btnType: BtnTypes.textWithIcon,
            btnColor: Colors.white,
            radius: 1,
            isLoading: false,
            icon: const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
            onClicked: goToNextStep,
          ),
        ),
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('nextStepTitle', nextStepTitle));
  // }
}
