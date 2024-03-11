import 'package:flutter/material.dart';
import 'package:stc_training/features/category/models/category_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class CategoryCardComp extends StatelessWidget {
  CategoryCardComp({super.key, required this.category});

  CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 135,
            child: CustomTextUtil(
              text1: "${category!.name}",
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: AppConstants.height_5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextUtil(
                text1: "${category!.totalCourses} ",
                textColor: AppColors.secondary,
                fontWeight1: FontWeight.w500,
                textAlign: TextAlign.center,
                hasAnotherText: true,
                text2: "Course",
                text2Color: AppColors.secondary,
                fontWeight2: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
