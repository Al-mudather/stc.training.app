import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/small_text_util.dart';

class ExpandableListItemsUtil extends HookWidget {
  const ExpandableListItemsUtil({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    var searchController = TextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    double listHeight = 200;
    var showMore = useState(false);
    var dataList = [
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
      _ITEM_list(),
    ];
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              showMore.value ? dataList.length : 4, (index) => _ITEM_list()),
        ),
        CustomBtnUtil(
          btnTitle: showMore.value ? "Show Less" : "Show More",
          btnColor: AppColors.brown,
          btnType: BtnTypes.textWithIcon,
          icon: showMore.value
              ? const Icon(
                  Icons.more_vert,
                  color: AppColors.brown,
                )
              : const Icon(
                  Icons.more_horiz,
                  color: AppColors.brown,
                ),
          onClicked: () {
            showMore.value = !showMore.value;
          },
        ),
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
