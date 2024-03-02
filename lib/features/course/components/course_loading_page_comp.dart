import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseLoadingPageComp extends StatelessWidget {
  const CourseLoadingPageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 70),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(AppConstants.height_10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 160,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Course_header_card(),
                const SizedBox(height: 20.0),
                Share_and_instructor_name(),
                const SizedBox(height: 20.0),
                About_the_course(),
                const SizedBox(height: 20.0),
                What_you_will_learn(),
                const SizedBox(height: 20.0),
                Course_chapters(),
                const SizedBox(height: 20.0),
                Course_instructors(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column Course_instructors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 10.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            5,
            (index) => Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Column Course_chapters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 10.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            5,
            (index) => Container(
              width: double.infinity,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Column What_you_will_learn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 10.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            5,
            (index) => Container(
              width: double.infinity,
              height: 15.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Column About_the_course() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 10.0,
          color: Colors.white,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Container Course_header_card() {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Row Share_and_instructor_name() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30.0,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 200,
          height: 10.0,
          color: Colors.white,
        ),
        Spacer(),
        Container(
          width: 40,
          height: 40.0,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }
}
