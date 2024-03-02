import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DialogHelper {
  //? Show Loading dialog
  static void SHOW_loading({String? message}) {
    // Get.dialog(
    //   SimpleDialog(
    //     title: SpinKitPulsingGrid(
    //       color: AppColors.primary,
    //     ),
    //   ),
    // );
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitPulsingGrid(
                // color: AppColors.primary,
                color: Colors.white,
              ),
              Text(message ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  //? Hide the dialog
  static void HIDE_loading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
