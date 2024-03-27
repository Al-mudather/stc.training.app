import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/marketing/components/withdraw_card_component.dart';
import 'package:stc_training/features/marketing/hooks/get_my_withdraws_hook.dart';
import 'package:stc_training/features/marketing/models/withdraw_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/section_title_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class WithdrawOrdersSection extends HookWidget {
  const WithdrawOrdersSection({super.key});

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
    result = UseGet_my_withdraws_query_hook(
      context: context,
    );
    //? Get the course data
    AllWithdrawsModel? withdraws = result['data'];
    return Column(
      children: [
        SectionTitleUtil(
          firstText: "Withdraw Orders",
          firstTextColor: AppColors.blacklight2,
          firstTextSize: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        result['loading'] ? The_loading() : The_data(withdraws: withdraws)
      ],
    );
  }

  SkeletonLoadingUtil The_loading() {
    return SkeletonLoadingUtil(
      child: Column(
        children: List.generate(
          5,
          (index) => Container(
            height: 50,
            color: Colors.amber,
            margin: EdgeInsets.only(top: 20),
          ),
        ),
      ),
    );
  }

  Container The_data({AllWithdrawsModel? withdraws}) {
    LOG_THE_DEBUG_DATA(messag: withdraws);
    return Container(
      padding: EdgeInsets.all(11),
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
      child: Wrap(
        runSpacing: 10,
        children: [
          WithDrawCardComponent(
            cardLabel: "Paied",
            withdrawDate: "2021-08-07",
            imgPath: "assets/svgs/done_status.svg",
            amount: "1,588",
          ),
          WithDrawCardComponent(
            cardLabel: "Waiting",
            withdrawDate: "2021-08-01",
            imgPath: "assets/svgs/waiting_status.svg",
            amount: "588",
          ),
        ],
        // children: List.generate(
        //   withdraws['edges'].length,
        //   (index) => WithDrawCardComponent(),
        // ),
      ),
    );
  }
}
