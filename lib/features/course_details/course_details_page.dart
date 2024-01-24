import 'package:flutter/material.dart';
import 'package:stc_training/features/course_details/components/header_card_component.dart';
import 'package:stc_training/features/course_details/components/share_and_instructor_name_component.dart';
import 'package:stc_training/features/course_details/sections/about_the_course_section.dart';
import 'package:stc_training/features/course_details/sections/course_chapters_section.dart';
import 'package:stc_training/features/course_details/sections/course_instructors_section.dart';
import 'package:stc_training/features/course_details/sections/what_you_will_learn_section.dart';
import 'package:stc_training/features/home/sections/instructors_section.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderCardComponent(),
              const SizedBox(
                height: 30,
              ),
              ShareAndInstructorNameComponent(),
              const SizedBox(
                height: 30,
              ),
              AboutTheCourseSection(),
              const SizedBox(
                height: 20,
              ),
              WhatYouWillLearnSection(),
              const SizedBox(
                height: 10,
              ),
              CourseChaptersSection(),
              const SizedBox(
                height: 20,
              ),
              CourseInstructorsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
