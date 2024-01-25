import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/bolit_item_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class QualificationsTabBarView extends StatelessWidget {
  const QualificationsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.greylight.withOpacity(0.1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svgs/qualifications.svg',
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomTextUtil(
                text1: "Qualifications :",
                fontWeight1: FontWeight.w600,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            runSpacing: 5,
            children: List.generate(
              10,
              (index) => BolitItemUtil(
                size: 14,
                text:
                    "Become an advanced, confident, and modern React developer from scratch",
              ),
            ),
          )
        ],
      ),
    );
  }
}
