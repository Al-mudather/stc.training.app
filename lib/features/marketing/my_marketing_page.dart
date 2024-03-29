import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/marketing/sections/joined_throw_me_section.dart';
import 'package:stc_training/features/marketing/sections/my_marketing_code_section.dart';
import 'package:stc_training/features/marketing/sections/profits_section.dart';
import 'package:stc_training/features/marketing/sections/withdraw_orders_section.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class MyMarketingPage extends HookWidget {
  const MyMarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollCtl = useScrollController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarUtil(barText: "My Marketing Page"),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          controller: scrollCtl,
          child: Column(
            children: [
              JoinedThrowMeSection(),
              const SizedBox(
                height: 30,
              ),
              MyMarketingCodeSection(),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        // Set the icon of the button
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        // Set the action of the button
        onPressed: () {
          // Use the animateTo method to scroll to the top
          scrollCtl.animateTo(
            scrollCtl.position.minScrollExtent, // The offset to scroll to
            duration:
                const Duration(seconds: 1), // The duration of the animation
            curve: Curves.easeOut, // The curve of the animation
          );
        },
      ),
    );
  }
}
