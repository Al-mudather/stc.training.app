import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/course_card_component.dart';

class CoursesTabBarView extends StatelessWidget {
  const CoursesTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) => Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(
          10,
          (index) => CourseCardComponent(
            width: 175,
          ),
        ),
      ),
    );
  }
}
