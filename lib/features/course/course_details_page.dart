import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/course/components/course_loading_card_comp.dart';
import 'package:stc_training/features/course/components/course_loading_page_comp.dart';
import 'package:stc_training/features/course/components/header_card_component.dart';
import 'package:stc_training/features/course/components/share_and_instructor_name_component.dart';
import 'package:stc_training/features/course/hooks/get_course_data_by_pk_hook.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/course/sections/about_the_course_section.dart';
import 'package:stc_training/features/course/sections/course_chapters_section.dart';
import 'package:stc_training/features/course/sections/course_instructors_section.dart';
import 'package:stc_training/features/course/sections/what_you_will_learn_section.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';

class CourseDetailsPage extends HookWidget {
  const CourseDetailsPage({
    super.key,
    required this.coursePk,
  });

  final String coursePk;

  @override
  Widget build(BuildContext context) {
    ////  1) convert the class to hook widget class. [ Done ]
    //// Get the course data by pk [ Done ]
    //TODO: 3) Fill the course header card data
    //TODO: 4) Make the share course btn works
    //TODO: 5) Fill about the course section data
    //TODO: 6) Fill the course chapter section data
    //TODO: 7) Fill the course instructors section data
    //TODO: 8) Get the what you will learn section data and fill it
    //TODO: 9) Add the course to the shopping card list
    //TODO:

    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> result;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    result =
        UseGet_course_data_pk_query_hook(context: context, coursePk: coursePk);
    // LOG_THE_DEBUG_DATA(messag: result);

    return Scaffold(
      appBar: AppBarUtil(
        barText: "Course Details",
      ),
      body: CourseLoadingPageComp(),
      // body: COURSE_data(),
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

  Container COURSE_data({CourseModel? course}) {
    return Container(
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
    );
  }
}