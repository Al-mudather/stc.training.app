import 'package:flutter/material.dart';
import 'package:stc_training/features/course/components/course_loading_card_comp.dart';
import 'package:stc_training/helper/app_constants.dart';

class AllCoursesLoadingPageComp extends StatelessWidget {
  const AllCoursesLoadingPageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppConstants.height_20,
          vertical: AppConstants.height_20,
        ),
        child: Wrap(
          runSpacing: 20,
          spacing: 20,
          children: List.generate(10, (index) => CourseLoadingCardComp()),
        ),
      ),
    );
  }
}
