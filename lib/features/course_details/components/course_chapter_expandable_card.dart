import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class CourseChapterExpandableCard extends StatefulWidget {
  const CourseChapterExpandableCard({
    super.key,
    required this.cardTitle,
    required this.cardSubTitle,
    this.allowActions = true,
  });

  final String cardTitle;
  final String cardSubTitle;
  final bool allowActions;

  @override
  State<CourseChapterExpandableCard> createState() =>
      _CourseChapterExpandableCardState();
}

class _CourseChapterExpandableCardState
    extends State<CourseChapterExpandableCard> {
  var isExpanded = false;

  List<Map> timesRange = [
    {
      "isActive": true,
      "isChecked": false,
      "numberOfHours": 1,
      "startTime": "09:00 Am",
      "endTime": "10:00 Am"
    },
    {
      "isActive": true,
      "isChecked": false,
      "numberOfHours": 1,
      "startTime": "10:00 Am",
      "endTime": "11:00 Am"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // height: ,
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 10,
      ),
      child: Card(
        color: AppColors.verylightOrange,
        child: ExpansionTile(
          shape: const Border(),
          // trailing: AnimatedIconBoxUtil(iconData: AnimatedIcons.list_view),
          trailing: isExpanded
              ? expansionIcon(
                  icon: Icons.keyboard_arrow_up,
                  isExpanded: isExpanded,
                )
              : expansionIcon(
                  icon: Icons.keyboard_arrow_down,
                  isExpanded: isExpanded,
                ),
          title: returnTheCardHead(),
          children: [
            CardBody(),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => isExpanded = expanded);
          },
        ),
      ),
    );
  }

  Widget returnTheCardHead() {
    if (isExpanded) {
      if (widget.allowActions) {
        return cardAction();
      }
    }
    return cardTitle();
  }

  Row cardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextUtil(
          text1: widget.cardTitle,
          fontSize1: 14,
          fontWeight1: FontWeight.w800,
          hasAnotherText: false,
        ),
        CustomTextUtil(
          text1: widget.cardSubTitle,
          fontSize1: 12,
          fontWeight1: FontWeight.w700,
          hasAnotherText: false,
          textColor: AppColors.blacklight4,
        ),
      ],
    );
  }

  Container expansionIcon({required IconData icon, required bool isExpanded}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.purple),
      child: Icon(icon, color: Colors.white),
    );
  }

  SizedBox cardAction() {
    return const SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: 136,
                child: CustomBtnUtil(
                  btnTitle: "Edit",
                  btnType: BtnTypes.eleveated,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomBtnUtil(
                btnTitle: "Delete",
                btnColor: AppColors.errorDark,
                btnType: BtnTypes.outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container CardBody() {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextUtil(
                text1: "Selected Schedule",
                fontSize1: 14,
                fontWeight1: FontWeight.w800,
                hasAnotherText: false,
              ),
              CustomTextUtil(
                text1: "1 Day - 8 Hours",
                fontSize1: 12,
                fontWeight1: FontWeight.w700,
                hasAnotherText: false,
                textColor: AppColors.blacklight4,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListBody(
            children: timesRange.map((time) => timeRange(time)).toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1.5,
            width: double.maxFinite,
            color: AppColors.blacklight2,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextUtil(
                text1: "Cost",
                fontSize1: 18,
                fontWeight1: FontWeight.w900,
                hasAnotherText: false,
                textColor: AppColors.blacklight3,
              ),
              CustomTextUtil(
                text1: "250 ETB",
                fontSize1: 18,
                fontWeight1: FontWeight.w900,
                hasAnotherText: false,
                textColor: AppColors.blacklight3,
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 1,
          //   width: double.maxFinite,
          //   color: AppColors.blacklight2,
          // ),
        ],
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
