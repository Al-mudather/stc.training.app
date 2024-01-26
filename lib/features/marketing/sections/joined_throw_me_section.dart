import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class JoinedThrowMeSection extends StatelessWidget {
  const JoinedThrowMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColors.primary,
            ),
            child: SvgPicture.asset("assets/svgs/copy.svg"),
          ),
          Spacer(),
          CustomTextUtil(
            text1: "302 ",
            fontSize1: 27,
            textColor: AppColors.dark,
            hasAnotherText: true,
            text2: "Joined throw me",
            fontWeight2: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
