import 'package:flutter/material.dart';
import 'package:stc_training/features/marketing/components/my_marketing_page_card_component.dart';

class ProfitsSection extends StatelessWidget {
  const ProfitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyMarketingPageCardComponent(
          cardLabel: "My Account",
          btnLabel: "Withdrawal",
          amount: "1,588",
          imagePath: "assets/svgs/coins_money.svg",
        ),
        MyMarketingPageCardComponent(
          cardLabel: "Due profits",
          btnLabel: "Collect",
          amount: "2480",
          imagePath: "assets/svgs/money.svg",
        ),
      ],
    );
  }
}
