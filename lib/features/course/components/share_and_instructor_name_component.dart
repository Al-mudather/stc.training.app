import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ShareAndInstructorNameComponent extends StatelessWidget {
  const ShareAndInstructorNameComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _SHARE_button(),
        Row(
          children: [
            CustomTextUtil(
              text1: "د.صبري سعد الطيب سعد",
            ),
            const SizedBox(
              width: 10,
            ),
            _INSTRUCTOR_image(),
          ],
        ),
      ],
    );
  }

  Container _INSTRUCTOR_image() {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            color: const Color(0xFFFCC74C).withOpacity(0.5),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/sabri.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Ink _SHARE_button() {
    return Ink(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.4),
            spreadRadius: 5,
          )
        ],
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: SvgPicture.asset(
          'assets/svgs/share.svg',
          height: 17,
          width: 17,
        ),
        onPressed: () => {},
        alignment: Alignment.center,
      ),
    );
  }
}
