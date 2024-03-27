import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/marketing/components/my_marketing_page_card_component.dart';
import 'package:stc_training/features/marketing/hooks/get_my_balance_hook.dart';
import 'package:stc_training/features/marketing/hooks/get_my_rewards_hook.dart';
import 'package:stc_training/helper/methods.dart';

class ProfitsSection extends HookWidget {
  const ProfitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> balanceResult, rewardsResult;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    balanceResult = UseGet_my_balance_query_hook(
      context: context,
    );
    var myBalance = balanceResult['data'];

    rewardsResult = UseGet_my_rewards_query_hook(
      context: context,
    );
    var myRewards = rewardsResult['data'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyMarketingPageCardComponent(
          cardLabel: "My Account",
          btnLabel: "Withdrawal",
          amount: "$myRewards",
          imagePath: "assets/svgs/coins_money.svg",
        ),
        MyMarketingPageCardComponent(
          cardLabel: "Due profits",
          btnLabel: "Collect",
          amount: "$myBalance",
          imagePath: "assets/svgs/money.svg",
        ),
      ],
    );
  }
}
