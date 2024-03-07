import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/video_player/controller/video_controller.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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

  static void SHOW_video_dialog({CourseUnitContentModel? content}) {
    Get.dialog(
      Dialog(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              // transformAlignment: Alignment.centerRight,
              child: CustomBtnUtil(
                btnTitle: "",
                btnType: BtnTypes.filledIcon,
                radius: 50,
                iconRadius: 50,
                iconSize: 12,
                fontSize: 12,
                iconFilled: Colors.white,
                onClicked: () => {},
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
            GetBuilder<VideoController>(
              init: VideoController(
                videoPath:
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
              ),
              builder: (controller) {
                // return Container(
                //   child: controller.videoPlayerController.value.isInitialized
                //       ? VideoPlayer(controller.videoPlayerController)
                //       : CircularProgressIndicator(),
                // );
                return (controller.chewieController != null &&
                        controller.chewieController!.videoPlayerController.value
                            .isInitialized)
                    ? Chewie(controller: controller.chewieController!)
                    : Text("Error");
              },
            ),
          ],
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
