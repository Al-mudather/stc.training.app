import 'package:flutter/material.dart';
import 'package:stc_training/features/marketing/components/withdraw_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/section_title_util.dart';

class WithdrawOrdersSection extends StatelessWidget {
  const WithdrawOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
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
        Container(
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
            //   10,
            //   (index) => WithDrawCardComponent(),
            // ),
          ),
        ),
      ],
    );
  }
}
