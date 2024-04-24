import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/class_room/components/class_chapter_item_content_comp.dart';
import 'package:stc_training/features/class_room/controller/class_room_controller.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class ClassChapterExpandableCard extends StatefulWidget {
  const ClassChapterExpandableCard({
    super.key,
    this.allowActions = true,
    required this.unit,
  });

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
          (content) => content.modelName == 'ContentVideo',
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
            (index) =>
                ClassChapterItemContentComp(content: acceptedContents?[index]),
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
