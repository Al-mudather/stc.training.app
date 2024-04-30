import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/controller/offline_courses_controller.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/directory_path.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/services/CRUD/offline_video_model.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:path/path.dart' as Path;
import 'package:dio/dio.dart';

class OfflineChapterItemContentComp extends StatefulWidget {
  const OfflineChapterItemContentComp({super.key, required this.video});

  final OfflineVideoModel? video;

  @override
  State<OfflineChapterItemContentComp> createState() =>
      _OfflineChapterItemContentCompState();
}

class _OfflineChapterItemContentCompState
    extends State<OfflineChapterItemContentComp> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  String netWorkFilePath = "";
  late String filePath;
  late String fileUrl;
  late CancelToken cancelToken;

  late String videoUuid;
  var getPathFile = DirectoryPath();

  final OfflineCoursesController offlineCoursectl =
      Get.find<OfflineCoursesController>();

  @override
  void initState() {
    super.initState();
  }

  get videoDirectoryPath => () async {
        //Todo: Get the dircetory path
        String appDocPath =
            await DirectoryPath().getApplicationDocumentsStoragePath();
        return "$appDocPath/video";
      };

  DELETE_video_files_folder() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    String dirPath = "$appDocPath/video/$videoUuid/";
    final dir = Directory(dirPath);
    if (dir.existsSync()) {
      try {
        dir.deleteSync(recursive: true);
        setState(() {
          fileExists = false;
        });
      } catch (e) {
        LOG_THE_DEBUG_DATA(messag: e, type: 'e');
      }
    }
  }

  PLAY_the_offline_video() async {
    try {
      // LOG_THE_DEBUG_DATA(messag: e, type: 'e');
      // String appDocPath =
      //     await DirectoryPath().getApplicationDocumentsStoragePath();
      // String dirPath =
      //     "$appDocPath/video/${widget.video?.videoUuid}/playlist.m3u8";

      // Get.toNamed(Routehelper.GoToOfflineVideoPlayerPage(
      //     localVideoPath: widget.video?.storagePath ?? ''));

      Get.toNamed(Routehelper.GoToOfflineVideoPlayerPage(
          localVideoPath: widget.video?.storagePath ?? ''));
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PLAY_the_offline_video();
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top:
                BorderSide(color: AppColors.brown.withOpacity(0.5), width: 0.5),
          ),
        ),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/opened_lock.svg'),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomTextUtil(
                  text1: "${widget.video?.title ?? ''}",
                  fontSize1: 14,
                  fontWeight1: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              CustomBtnUtil(
                  btnTitle: "",
                  btnType: BtnTypes.filledIcon,
                  onClicked: () async {
                    PLAY_the_offline_video;
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: AppColors.successDark,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
