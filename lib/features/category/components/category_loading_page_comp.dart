import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stc_training/helper/app_constants.dart';

class CategoryLoadingPageComp extends StatelessWidget {
  const CategoryLoadingPageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppConstants.verticalPadding,
          horizontal: AppConstants.horizentalPadding,
        ),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(
            20,
            (index) => _CATEGORY_card(),
          ),
        ),
      ),
    );
  }

  Container _CATEGORY_card() {
    return Container(
      width: 165,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
                width: 100,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 70,
                height: 10.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
