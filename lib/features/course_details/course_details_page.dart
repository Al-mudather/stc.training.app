import 'package:flutter/material.dart';
import 'package:stc_training/features/course_details/components/header_card_component.dart';

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
        child: HeaderCardComponent(),
      ),
    );
  }
}
