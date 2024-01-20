import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/instructor_card_component.dart';
import 'package:stc_training/features/home/sections/courses_section.dart';
import 'package:stc_training/features/home/sections/instructors_section.dart';
import 'package:stc_training/features/home/sections/marketing_section.dart';
import 'package:stc_training/features/home/sections/search_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: const Column(
          children: [
            SearchSection(),
            SizedBox(
              height: 20,
            ),
            MarketingSection(),
            SizedBox(
              height: 20,
            ),
            CoursesSection(),
            SizedBox(
              height: 20,
            ),
            InstructorsSection(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
