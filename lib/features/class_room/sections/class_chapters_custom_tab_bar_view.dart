import 'package:flutter/material.dart';
import 'package:stc_training/features/class_room/components/class_chapter_expandable_card.dart';

class ClassChapterCustomTabBarView extends StatelessWidget {
  const ClassChapterCustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 2,
        children: List.generate(
          10,
          (index) => ClassChapterExpandableCard(
            cardTitle: "Chapter $index",
            cardSubTitle: "This is a text",
          ),
        ),
      ),
    );
  }
}
