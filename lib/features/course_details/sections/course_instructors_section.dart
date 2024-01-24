import 'package:flutter/material.dart';
import 'package:stc_training/features/course_details/components/course_instructor_card_component.dart';
import 'package:stc_training/utils/section_title_util.dart';

class CourseInstructorsSection extends StatelessWidget {
  const CourseInstructorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleUtil(secondText: "Instructors"),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          runSpacing: 15,
          children: List.generate(
            5,
            (index) => CourseInstructorCardComponent(),
          ),
        ),
      ],
    );
  }
}
