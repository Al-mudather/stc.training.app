import 'package:flutter/material.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/utils/expandable_text_util.dart';
import 'package:stc_training/utils/section_title_util.dart';

class AboutTheCourseSection extends StatelessWidget {
  const AboutTheCourseSection({super.key, required this.course});

  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleUtil(secondText: "About the course"),
        const SizedBox(
          height: 5,
        ),
        ExpandableTextUtil(
          text: "${course?.brief}",
        ),
      ],
    );
  }
}
