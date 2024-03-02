import 'package:flutter/material.dart';
import 'package:stc_training/features/home/sections/courses_section.dart';
import 'package:stc_training/features/home/sections/marketing_section.dart';
import 'package:stc_training/features/home/sections/search_section.dart';
import 'package:stc_training/helper/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  //TODO: 1) When a user clicks on the course , navigate to the course details page.
  //TODO: 2) Fill the course details with the data.
  //TODO: 3) When the user clicks on the marketing details btn, navigate to the course details page that related to the marketing card.
  //TODO:
  //TODO:
  //TODO:

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
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
