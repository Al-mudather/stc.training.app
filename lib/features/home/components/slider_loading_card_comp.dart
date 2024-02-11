import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stc_training/helper/app_constants.dart';

class SliderLoadingCardComp extends StatelessWidget {
  const SliderLoadingCardComp({super.key});

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
          padding: const EdgeInsets.all(AppConstants.radius_10),
          width: AppConstants.width_100 +
              AppConstants.width_50 +
              AppConstants.width_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: AppConstants.width_100 * 3,
                height: AppConstants.height_20,
                margin: EdgeInsets.only(
                  top: AppConstants.height_10,
                ),
                color: Colors.white,
              ),
              const SizedBox(height: AppConstants.height_20),

              // const SizedBox(height: 10.0),
              Container(
                width: AppConstants.width_100,
                height: AppConstants.height_20 + AppConstants.height_5,
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
