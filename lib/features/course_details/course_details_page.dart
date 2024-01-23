import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/course_details/components/header_card_component.dart';
import 'package:stc_training/features/course_details/components/share_and_instructor_name_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Details"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            HeaderCardComponent(),
            const SizedBox(
              height: 30,
            ),
            ShareAndInstructorNameComponent(),
          ],
        ),
      ),
    );
  }
}
