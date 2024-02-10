import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/instructor_card_component.dart';
import 'package:stc_training/features/home/sections/courses_section.dart';
import 'package:stc_training/features/home/sections/instructors_section.dart';
import 'package:stc_training/features/home/sections/marketing_section.dart';
import 'package:stc_training/features/home/sections/search_section.dart';
import 'package:stc_training/helper/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: const Column(
          children: [
            SizedBox(
              height: AppConstants.height_20,
            ),
            SearchSection(),
            SizedBox(
              height: AppConstants.height_20,
            ),
            MarketingSection(),
            SizedBox(
              height: AppConstants.height_20,
            ),
            CoursesSection(),
            SizedBox(
              height: AppConstants.height_20,
            ),
            // InstructorsSection(),
            SizedBox(
              height: AppConstants.height_20,
            ),
          ],
        ),
      ),
    );
  }
}
