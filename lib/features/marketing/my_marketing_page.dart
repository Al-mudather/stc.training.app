import 'package:flutter/material.dart';
import 'package:stc_training/features/marketing/components/my_marketing_page_card_component.dart';
import 'package:stc_training/features/marketing/sections/joined_throw_me_section.dart';
import 'package:stc_training/features/marketing/sections/profits_section.dart';
import 'package:stc_training/features/marketing/sections/withdraw_orders_section.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class MyMarketingPage extends StatelessWidget {
  const MyMarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarUtil(barText: "My Marketing Page"),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              JoinedThrowMeSection(),
              const SizedBox(
                height: 30,
              ),
              ProfitsSection(),
              const SizedBox(
                height: 30,
              ),
              WithdrawOrdersSection()
            ],
          ),
        ),
      ),
    );
  }
}
