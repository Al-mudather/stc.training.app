import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseClassLoadingPageComp extends StatelessWidget {
  const CourseClassLoadingPageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
                Taps_label(),
                const SizedBox(height: 20.0),
                Course_chapters(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column Course_chapters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            10,
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

  Container Course_header_card() {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  Row Taps_label() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 15.0,
          color: Colors.white,
        ),
        Spacer(),
        Container(
          width: 50,
          height: 15.0,
          color: Colors.white,
        ),
      ],
    );
  }
}
