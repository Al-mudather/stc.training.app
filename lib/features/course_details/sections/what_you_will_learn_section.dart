import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/expandable_list_items_util.dart';
import 'package:stc_training/utils/expandable_text_util.dart';
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

        // Wrap(
        //   spacing: 10,
        //   runSpacing: 10,
        //   children: List.generate(10, (index) => _ITEM_list()),
        // ),
        // ExpandableTextUtil(
        //   text:
        //       "مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى , مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى ,مشكلة البيسك Basic sciences بتواجهنا من ايام الجامعة الاولى ولمن نصل الكلينك بنلقى روحنا ما قادرين نربط وكمان بعد نتخرج لمن نجي لامتحانات التخصص بنلقى ",
        // ),
      ],
    );
  }

  Row _ITEM_list() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.brown,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SmallTextUtil(
            size: 14,
            text:
                "Become an advanced, confident, and modern React developer from scratch",
          ),
        ),
      ],
    );
  }
}
