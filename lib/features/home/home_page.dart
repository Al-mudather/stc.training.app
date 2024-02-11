import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/instructor_card_component.dart';
import 'package:stc_training/features/home/components/slider_loading_card_comp.dart';
import 'package:stc_training/features/home/sections/courses_section.dart';
import 'package:stc_training/features/home/sections/instructors_section.dart';
import 'package:stc_training/features/home/sections/marketing_section.dart';
import 'package:stc_training/features/home/sections/search_section.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/utils/horizontal_loading_data_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            // CoursesSection(),
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
