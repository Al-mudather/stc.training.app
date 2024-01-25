import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class AppBarUtil extends StatelessWidget implements PreferredSizeWidget {
  const AppBarUtil({
    super.key,
    required this.barText,
    this.textSize = 18,
    this.textColor = AppColors.deepBlack,
    this.backgroundColor = Colors.transparent,
  });

  final String barText;
  final double textSize;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextUtil(
        text1: barText,
        fontSize1: textSize,
        fontWeight1: FontWeight.w800,
        textColor: textColor,
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: CustomBtnUtil(
          btnTitle: "",
          btnType: BtnTypes.filledIcon,
          iconFilled: Colors.white,
          iconRadius: 25,
          fontSize: 24,
          icon: SvgPicture.asset("assets/svgs/app_bar_back_arrow.svg"),
          // icon: const Icon(
          //   Icons.arrow_back,
          //   color: AppColors.blacklight4,
          // ),
          onClicked: () {
            // Get.back();
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
