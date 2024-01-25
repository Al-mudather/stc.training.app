import 'package:flutter/material.dart';
import 'package:stc_training/features/instructor/sections/instructor_page_header_card_section.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class InstructorPage extends StatelessWidget {
  const InstructorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
        barText: "Instructor info",
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: InstructorPageHeaderCardSection(),
      ),
    );
  }
}
