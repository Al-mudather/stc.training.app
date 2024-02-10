import 'package:flutter/material.dart';
import 'package:stc_training/features/course/components/course_chapter_expandable_card.dart';
import 'package:stc_training/utils/section_title_util.dart';

class CourseChaptersSection extends StatelessWidget {
  const CourseChaptersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleUtil(secondText: "Course Chapters"),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          runSpacing: 2,
          children: List.generate(
            5,
            (index) => CourseChapterExpandableCard(
              cardTitle: "Chapter 1",
              cardSubTitle: "This is a text",
            ),
          ),
        ),
      ],
    );
  }
}
