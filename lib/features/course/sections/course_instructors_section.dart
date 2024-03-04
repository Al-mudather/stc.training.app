import 'package:flutter/material.dart';
import 'package:stc_training/features/course/components/course_instructor_card_component.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/utils/section_title_util.dart';

class CourseInstructorsSection extends StatelessWidget {
  const CourseInstructorsSection({super.key, required this.course});

  final CourseModel? course;

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
            course?.instructors.length ?? 0,
            (index) => CourseInstructorCardComponent(
                courseInstructor: course?.instructors[index]),
          ),
        ),
      ],
    );
  }
}
