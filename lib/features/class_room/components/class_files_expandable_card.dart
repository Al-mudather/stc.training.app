import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/class_room/components/class_file_item_content_comp.dart';
import 'package:stc_training/features/class_room/controller/class_room_controller.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/custom_text_util.dart';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ClassFilesExpandableCard extends StatefulWidget {
  const ClassFilesExpandableCard({
    super.key,
    this.allowActions = true,
    required this.unit,
  });

  final bool allowActions;

  final CourseUnitModel? unit;

  @override
  State<ClassFilesExpandableCard> createState() =>
      _ClassFilesExpandableCardState();
}

class _ClassFilesExpandableCardState extends State<ClassFilesExpandableCard> {
  var isExpanded = false;
  var isLoading = false;

  ClassRoomController classRoomCtl = Get.find<ClassRoomController>();

  @override
  Widget build(BuildContext context) {
    var acceptedContents = widget.unit?.courseUnitContents?.courseUnitContents
        .where(
          (content) => content.modelName == 'ContentFile',
        )
        .toList();
    return Container(
      width: double.maxFinite,
      // height: ,
      // margin: const EdgeInsets.only(
      //   bottom: 10,
      // ),
      child: Card(
        // color: AppColors.verylightOrange,
        color: Colors.white,
        child: ExpansionTile(
          shape: const Border(),
          // trailing: AnimatedIconBoxUtil(iconData: AnimatedIcons.list_view),
          trailing: SizedBox(), // Hide the arrow
          leading: isExpanded
              ? expansionIcon(
                  icon: Icons.keyboard_arrow_up,
                  isExpanded: isExpanded,
                )
              : expansionIcon(
                  icon: Icons.keyboard_arrow_down,
                  isExpanded: isExpanded,
                ),
          title: cardTitle(),
          children: List.generate(
            acceptedContents?.length ?? 0,
            // (index) => _EXPANDED_body_item(content: acceptedContents![index]),
            (index) =>
                ClassFileItemContentComp(content: acceptedContents![index]),
          ),
          onExpansionChanged: (bool expanded) {
            setState(() => isExpanded = expanded);
          },
        ),
      ),
    );
  }

  Widget cardTitle() {
    return CustomTextUtil(
      text1: "${widget.unit?.title}",
      fontSize1: 14,
      fontWeight1: FontWeight.w800,
      hasAnotherText: false,
    );
  }

  Container expansionIcon({required IconData icon, required bool isExpanded}) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryLight2,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  void Extract_the_video_data({CourseUnitContentModel? content}) {
    //TODO: Go to the video player page
    //Todo: Start the loading
    try {
      String? cipherIfram = content!.cipherIframe;
      var cipherOtp, playbackInfo;
      if (cipherIfram != null && cipherIfram.isNotEmpty) {
        var otp = cipherIfram.split('otp=')[1].split('&');
        cipherOtp = otp.first;
        var info = cipherIfram.split('playbackInfo=')[1].split('"');
        playbackInfo = info.first;
      }

      var contentData = jsonDecode('${content.modelValue}');
      var video_type = contentData["video_type"];
      var metaData = contentData['video_metadata'];
      var video = contentData['video'];

      var videoUuid;
      if (video_type == 'TYPE_HASIF') {
        videoUuid = metaData['videoData']['videoUuid'];
      }

      // classRoomCtl.SET_video_palyer_info_data(
      //   loading: false,
      //   videoName: '${content!.title}',
      //   videoType: video_type,
      //   cipherOtp: cipherOtp,
      //   cipherPlayBackInfo: playbackInfo,
      //   alhasifVideoUuid: videoUuid,
      // );

      if (video != null && video.toString().isNotEmpty) {
        SEND_a_message_to_the_user(
          message:
              "Video is not supported on the phone, please watch it on the web version.",
          messageLable: "Error",
          backgroundColor: AppColors.errorLight,
        );
      } else {
        Get.toNamed(
          Routehelper.GoToClassRoomVideoPlayerPage(
            videoTitle: '${content.title}',
            unitContent: jsonEncode({
              'video_type': video_type,
              'cipherOtp': cipherOtp,
              'playbackInfo': playbackInfo,
              'videoUuid': videoUuid,
            }),
          ),
        );
      }
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  Container timeRange(Map<dynamic, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.blacklight4,
              ),
            ),
            child: Center(
              child: CustomTextUtil(
                text1: item["startTime"],
                fontSize1: 12,
                hasAnotherText: false,
                fontWeight1: FontWeight.w600,
                textColor: AppColors.blacklight4,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.blacklight4,
                        width: 1,
                      ),
                      color: AppColors.blacklight4,
                    ),
                  ),
                ),
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.blacklight4,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 90,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.blacklight4,
              ),
            ),
            child: Center(
              child: CustomTextUtil(
                text1: item["endTime"],
                fontSize1: 12,
                hasAnotherText: false,
                fontWeight1: FontWeight.w600,
                textColor: AppColors.blacklight4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
