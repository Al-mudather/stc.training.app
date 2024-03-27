import 'package:flutter/material.dart';
import 'package:stc_training/features/marketing/components/balance_ard_omponent.dart';
import 'package:stc_training/features/marketing/components/rewards_card_component.dart';

class ProfitsSection extends StatelessWidget {
  const ProfitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RewardsCardComponent(),
        BalanceCardComponent(),
      ],
    );
  }
}
