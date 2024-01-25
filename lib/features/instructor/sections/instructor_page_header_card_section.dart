import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:stc_training/utils/instructor_avatar_util.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as providerSVG;

class InstructorPageHeaderCardSection extends StatelessWidget {
  const InstructorPageHeaderCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 101,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -30,
            right: 0,
            bottom: -10,
            child: SvgPicture.asset(
              'assets/svgs/instructor_background_img.svg',
              colorFilter: ColorFilter.mode(
                // AppColors.primary.withOpacity(0.8),
                // BlendMode.modulate,
                AppColors.primary.withOpacity(0.8),
                BlendMode.multiply,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                InstructorAvatarUtil(
                  imagePath: "assets/images/sabri.png",
                  size: 85,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomTextUtil(
                  text1: "Dr.Sabri sad altayeb abo groun",
                  textColor: Colors.white,
                  fontWeight1: FontWeight.w700,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
