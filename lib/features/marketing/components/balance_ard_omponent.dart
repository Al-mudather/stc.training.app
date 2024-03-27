import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/marketing/components/withdraw_amount_dialog.dart';
import 'package:stc_training/features/marketing/hooks/get_my_balance_hook.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class BalanceCardComponent extends HookWidget {
  const BalanceCardComponent({
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
    Map<String, dynamic> balanceResult;
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

    return Container(
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
            child: SvgPicture.asset("assets/svgs/money.svg"),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextUtil(text1: 'Balance'),
          const SizedBox(
            height: 5,
          ),
          CustomTextUtil(
            text1: "$myBalance ",
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
              btnTitle: "Withdrawal",
              btnType: BtnTypes.textWithIcon,
              btnColor: AppColors.blacklight2,
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
              onClicked: () => OpenTheWithdrawAmountDialog(context: context),
            ),
          )
        ],
      ),
    );
  }

  OpenTheWithdrawAmountDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return const WithdrawAmountDialog();
      },
    );
  }
}
