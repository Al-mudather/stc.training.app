import 'package:flutter/material.dart';
import 'package:stc_training/features/instructor/models/instructor_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/big_text_util.dart';

class InstructorCardComponent extends StatelessWidget {
  InstructorCardComponent({super.key, required this.instructor});

  InstructorModel instructor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      // height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _cardImage(),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: _cardTitle(instructor: instructor),
          ),
          Text(
            "Instructor",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          _cardAction(),
        ],
      ),
    );
  }

  Container _cardAction() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primary,
      ),
      child: BigTextUtil(
        text: "More",
        fontSize: 16,
      ),
    );
  }

  // Widget _cardTitle({required InstructorModel instructor}) {
  //   return CustomTextUtil(
  //     text1: "${instructor.user!.fullName} \n",
  //     textAlign: TextAlign.center,
  //   );
  // }
  RichText _cardTitle({required InstructorModel instructor}) {
    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: "${instructor.user!.fullName}",
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 16,
        ),
      ),
    );
  }

  Container _cardImage() {
    return Container(
      height: 84,
      width: 84,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            color: const Color(0xFFFCC74C).withOpacity(0.5),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/sabri.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
