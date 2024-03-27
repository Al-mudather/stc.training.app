import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/marketing/controller/marketing_controller.dart';
import 'package:stc_training/features/marketing/hooks/get_collect_the_rewards_hook.dart';
import 'package:stc_training/features/marketing/hooks/get_my_rewards_hook.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class RewardsCardComponent extends HookWidget {
  const RewardsCardComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> rewardsResult;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    rewardsResult = UseGet_my_rewards_query_hook(
      context: context,
    );
    var myRewards = rewardsResult['data'];

    // Get the create mutation Hook
    final collectMutationHook =
        useCollectTheRewoardsMutationHook(context: context);

    return GetBuilder<MarketingController>(
      builder: (maketingInnerCtl) => Container(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
        ),
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: AppColors.grey),
              ),
              child: SvgPicture.asset("assets/svgs/coins_money.svg"),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextUtil(text1: 'Rewards'),
            const SizedBox(
              height: 5,
            ),
            CustomTextUtil(
              text1: "$myRewards ",
              hasAnotherText: true,
              text2: "SDG",
              fontSize2: 12,
              fontWeight2: FontWeight.w400,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 145,
              child: CustomBtnUtil(
                btnTitle: "Collect",
                btnType: BtnTypes.textWithIcon,
                btnColor: AppColors.blacklight2,
                isLoading: maketingInnerCtl.isWithdrawLoading,
                icon: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset("assets/svgs/arrow_white.svg"),
                  ),
                ),
                onClicked: () {
                  maketingInnerCtl.setIsWithdrawLoadingValue(true);
                  var payload = {'input': {}};
                  collectMutationHook.runMutation(payload);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
