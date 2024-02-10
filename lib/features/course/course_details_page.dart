import 'package:flutter/material.dart';
import 'package:stc_training/features/course/components/header_card_component.dart';
import 'package:stc_training/features/course/components/share_and_instructor_name_component.dart';
import 'package:stc_training/features/course/sections/about_the_course_section.dart';
import 'package:stc_training/features/course/sections/course_chapters_section.dart';
import 'package:stc_training/features/course/sections/course_instructors_section.dart';
import 'package:stc_training/features/course/sections/what_you_will_learn_section.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
        barText: "Course Details",
      ),
      // appBar: AppBar(
      //   title: Text("Course Details"),
      //   centerTitle: true,
      // ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.only(bottom: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderCardComponent(),
              const SizedBox(
                height: 30,
              ),
              ShareAndInstructorNameComponent(),
              const SizedBox(
                height: 30,
              ),
              AboutTheCourseSection(),
              const SizedBox(
                height: 20,
              ),
              WhatYouWillLearnSection(),
              const SizedBox(
                height: 10,
              ),
              CourseChaptersSection(),
              const SizedBox(
                height: 20,
              ),
              CourseInstructorsSection(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
        color: Colors.white,
        child: SizedBox(
          height: 48,
          width: double.maxFinite,
          child: CustomBtnUtil(
            btnTitle: "Take it now",
            btnColor: AppColors.primary,
            onClicked: () {
              // Get.toNamed(
              //   RouteHelper.goToEmployeeCreateNewDatatPage(
              //     enterPrisePk: enterprisePk,
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
