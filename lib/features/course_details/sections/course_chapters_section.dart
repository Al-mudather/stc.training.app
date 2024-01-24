import 'package:flutter/material.dart';
import 'package:stc_training/features/course_details/components/course_chapter_expandable_card.dart';
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
        CourseChapterExpandableCard(
            cardTitle: "Chapter 1", cardSubTitle: "This is a text")
      ],
    );
  }
}
