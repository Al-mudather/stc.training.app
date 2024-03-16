import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/video_player/controller/video_controller.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class CourseChapterExpandableCard extends StatefulWidget {
  const CourseChapterExpandableCard({
    super.key,
    required this.unit,
    this.allowActions = true,
  });

  final CourseUnitModel? unit;

  final bool allowActions;

  @override
  State<CourseChapterExpandableCard> createState() =>
      _CourseChapterExpandableCardState();
}

class _CourseChapterExpandableCardState
    extends State<CourseChapterExpandableCard> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    //? Some of the contents are empty holding ( NoneType as modelName)
    //? filter them out to get the data only
    var acceptedContents = widget.unit?.courseUnitContents?.courseUnitContents
        .where(
          (content) => content.modelName != 'NoneType',
        )
        .toList();

    return Container(
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        child: ExpansionTile(
          shape: const Border(),
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

  Widget _EXPANDED_body_item({CourseUnitContentModel? content}) {
    return GestureDetector(
      onTap: content?.isFree == true
          ? () {
              //TODO: Go to the video player page
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

              Get.toNamed(
                Routehelper.GoToVideoPlayerPage(
                  unitContent: jsonEncode({
                    'video_type': video_type,
                    'cipherOtp': cipherOtp,
                    'playbackInfo': playbackInfo,
                    'videoUuid': videoUuid,
                  }),
                ),
              );
            }
          : () => null,
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
              content?.isFree == true
                  ? SvgPicture.asset('assets/svgs/opened_lock.svg')
                  : SvgPicture.asset('assets/svgs/closed_lock.svg'),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: content?.isFree == true
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: CustomTextUtil(
                    text1: "${content?.title}",
                    fontSize1: 14,
                    fontWeight1: FontWeight.w500,
                    textColor: content?.isFree == true
                        ? AppColors.primary
                        : AppColors.blacklight2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
