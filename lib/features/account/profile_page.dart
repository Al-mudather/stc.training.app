import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarUtil(barText: "Profile"),
      bottomSheet: _SAVE_the_profile_data_action(),
    );
  }

  Container _SAVE_the_profile_data_action() {
    return Container(
      height: 72,
      padding: EdgeInsets.all(16),
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: SizedBox(
        height: 40,
        width: 200,
        child: CustomBtnUtil(
          btnTitle: "Save",
          btnType: BtnTypes.eleveatedWithIcon,
          // btnColor: Colors.white,
          isLoading: false,
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
          onClicked: () => {},
        ),
      ),
    );
  }
}
