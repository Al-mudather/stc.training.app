import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/class_room/controller/class_room_controller.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ClassChapterExpandableCard extends StatefulWidget {
  const ClassChapterExpandableCard({
    super.key,
    required this.cardTitle,
    required this.cardSubTitle,
    this.allowActions = true,
    required this.unit,
  });

  final String cardTitle;
  final String cardSubTitle;
  final bool allowActions;

  final CourseUnitModel? unit;

  @override
  State<ClassChapterExpandableCard> createState() =>
      _ClassChapterExpandableCardState();
}

class _ClassChapterExpandableCardState
    extends State<ClassChapterExpandableCard> {
  var isExpanded = false;

  ClassRoomController classRoomCtl = Get.find<ClassRoomController>();

  @override
  Widget build(BuildContext context) {
    var acceptedContents = widget.unit?.courseUnitContents?.courseUnitContents
        .where(
          (content) => content.modelName != 'NoneType',
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
            (index) => _EXPANDED_body_item(content: acceptedContents![index]),
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

  GestureDetector _EXPANDED_body_item({CourseUnitContentModel? content}) {
    return GestureDetector(
      onTap: () {
        //Extract the video data and send it to the video player
        Extract_the_video_data(content: content);
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
                  text1: "${content?.title}",
                  fontSize1: 14,
                  fontWeight1: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Extract_the_video_data({CourseUnitContentModel? content}) {
    //TODO: Go to the video player page
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
      var videoUuid;
      if (video_type == 'TYPE_HASIF') {
        videoUuid = metaData['videoData']['videoUuid'];
      }

      classRoomCtl.SET_video_palyer_info_data(
        videoName: '${content!.title}',
        videoType: video_type,
        cipherOtp: cipherOtp,
        cipherPlayBackInfo: playbackInfo,
        alhasifVideoUuid: videoUuid,
      );
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e);
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
