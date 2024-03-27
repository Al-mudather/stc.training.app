import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/marketing/hooks/get_how_many_joined_throw_me_hook.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class JoinedThrowMeSection extends HookWidget {
  const JoinedThrowMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> result;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////

    result = UseGet_how_many_joined_throw_me_query_hook(
      context: context,
    );
    // LOG_THE_DEBUG_DATA(messag: searchCtl.text);
    var joinedCount = result['data'];
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColors.primary,
            ),
            child: SvgPicture.asset("assets/svgs/copy.svg"),
          ),
          Spacer(),
          CustomTextUtil(
            text1: "$joinedCount ",
            fontSize1: 27,
            textColor: AppColors.dark,
            hasAnotherText: true,
            text2: "Joined throw me",
            fontWeight2: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
