import 'package:flutter/material.dart';
import 'package:stc_training/utils/expandable_text_util.dart';
import 'package:stc_training/utils/section_title_util.dart';

class AboutTheCourseSection extends StatelessWidget {
  const AboutTheCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleUtil(secondText: "About the course"),
        const SizedBox(
          height: 5,
        ),
        ExpandableTextUtil(
          text:
              "مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى , مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى ,مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى ",
        ),
      ],
    );
  }
}
