import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/home/components/my_course_card_component.dart';
import 'package:stc_training/features/home/components/my_offline_course_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/services/CRUD/offline_course_model.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class OffLineMyCoursesPage extends HookWidget {
  OffLineMyCoursesPage({
    super.key,
    this.isPage = true,
    required this.courses,
  });

  final bool isPage;
  final List<OfflineCourseModel> courses;

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    final ScrollController scrollCtl = useScrollController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    LOG_THE_DEBUG_DATA(messag: courses);

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////

    return Scaffold(
      appBar: isPage
          ? AppBarUtil(
              barText: "Offline Courses",
            )
          : null,
      body: SingleChildScrollView(
        controller: scrollCtl,
        child: Column(
          children: [
            const SizedBox(
              height: AppConstants.height_10,
            ),
            courses.length > 0
                ? _COURSES_data(scrollCtl: scrollCtl, courses: courses)
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        // Set the icon of the button
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        // Set the action of the button
        onPressed: () {
          // Use the animateTo method to scroll to the top
          scrollCtl.animateTo(
            scrollCtl.position.minScrollExtent, // The offset to scroll to
            duration:
                const Duration(seconds: 1), // The duration of the animation
            curve: Curves.easeOut, // The curve of the animation
          );
        },
      ),
    );
  }

  Container _COURSES_data({
    required ScrollController scrollCtl,
    required List<OfflineCourseModel> courses,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: AppConstants.horizentalPadding,
        vertical: AppConstants.verticalPadding,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Wrap(
            runSpacing: AppConstants.height_30 / 2,
            spacing: AppConstants.height_10,
            children: List.generate(
              courses.length ?? 0,
              (index) => MyOfflineCourseCardComponent(course: courses[index]),
            ),
          ),
          const SizedBox(
            height: AppConstants.height_20,
          ),
        ],
      ),
    );
  }
}
