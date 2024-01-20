import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/instructor_card_component.dart';
import 'package:stc_training/utils/title_text_util.dart';

class InstructorsSection extends StatelessWidget {
  const InstructorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
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
                        child: InstructorCardComponent(),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _sectionTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TitleTextUtil(
        firstText: "  Best",
        secondText: "Instructors",
      ),
    );
  }
}
