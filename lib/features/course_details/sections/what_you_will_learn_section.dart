import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/expandable_list_items_util.dart';
import 'package:stc_training/utils/section_title_util.dart';
import 'package:stc_training/utils/small_text_util.dart';

class WhatYouWillLearnSection extends StatelessWidget {
  const WhatYouWillLearnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitleUtil(secondText: "What will you learn"),
        const SizedBox(
          height: 15,
        ),
        ExpandableListItemsUtil(),
      ],
    );
  }
}
