import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stc_training/helper/app_constants.dart';

class InstructorLoadingCardComp extends StatelessWidget {
  const InstructorLoadingCardComp({super.key});

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
          width: 177,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 80.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 100,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 50,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 100,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
