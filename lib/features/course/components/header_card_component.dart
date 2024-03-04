import 'package:flutter/material.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class HeaderCardComponent extends StatelessWidget {
  const HeaderCardComponent({super.key, required this.course});

  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      height: 188.48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.primary.withOpacity(0.7),
            AppColors.primary.withOpacity(0.9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 1,
            spreadRadius: 1,
            color: Color(0XFF707070).withOpacity(0.2),
          ),
        ],
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          card_header(course: course),
          // NVDPROD25
          card_statistics(course: course),
          card_fotter(course: course),
        ],
      ),
    );
  }

  Row card_fotter({CourseModel? course}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextUtil(
          // text1: "90K",
          text1: "${course?.courseFeeInSdg}".split('.').first,
          textColor: AppColors.secondary,
          fontSize1: 20,
          hasAnotherText: true,
          text2: "sdg",
          identifier: "",
          text2Color: Colors.white,
          fontSize2: 15,
          fontWeight2: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Row card_statistics({CourseModel? course}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        course_setatistic_card(
          title: "Students",
          total: "${course?.enrollmentCount}",
          identifier: "",
        ),
        course_setatistic_card(
          title: "Hours",
          total: "${course?.courseHours}",
          identifier: "H",
        ),
        course_setatistic_card(
          title: "Language",
          total: "${course?.courseLanguage?.name}",
          identifier: "",
        ),
      ],
    );
  }

  Container card_header({CourseModel? course}) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      child: BigTextUtil(
        text: '${course?.title}',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.start,
      ),
    );
  }

  CustomTextUtil course_setatistic_card({
    required title,
    required total,
    required identifier,
  }) {
    return CustomTextUtil(
      text1: "$title \n",
      textColor: AppColors.secondary,
      fontSize1: 16,
      hasAnotherText: true,
      text2: "$total",
      identifier: "$identifier",
      text2Color: Colors.white,
      fontSize2: 18,
      fontWeight2: FontWeight.bold,
      textAlign: TextAlign.center,
    );
  }
}
