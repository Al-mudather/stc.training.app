import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/course_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/title_text_util.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CourseCardComponent(),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding _sectionTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleTextUtil(
            firstText: "  Available",
            secondText: "Courses",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BigTextUtil(
                text: "All Courses",
                size: 16,
                color: AppColors.brown,
                fontWeight: FontWeight.bold,
              ),
              Transform.rotate(
                angle: 110,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.secondary,
                ),
              ),
              Transform.translate(
                offset: const Offset(-20, 0),
                child: Transform.rotate(
                  angle: 110,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
