import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stc_training/helper/app_constants.dart';

class CourseLoadingCardComp extends StatelessWidget {
  const CourseLoadingCardComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.height_10),
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 120,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 20.0,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 10.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    width: 20,
                    height: 10.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
