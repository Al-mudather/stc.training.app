import 'package:flutter/material.dart';
import 'package:stc_training/features/course_details/course_details_page.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/layout/main_layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stc training app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const CourseDetailsPage(),
    );
  }
}
