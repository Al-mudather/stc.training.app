import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/controller/marketing_controller.dart';
import 'package:stc_training/features/marketing/hooks/get_withdraw_the_balance_hook.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_textField_util.dart';

class WithdrawAmountDialog extends HookWidget {
  const WithdrawAmountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    final TextEditingController amountCtl = useTextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    final amount = useState("");
    useEffect(
      () {
        //TODO: Listen to the change of the fullname hook
        amountCtl.addListener(() {
          amount.value = amountCtl.text;
        });
        return null;
      },
      [amountCtl],
    );

    MutationHookResult withdrawBalanceHook =
        useWithdrawTheBalanceHook(context: context);

    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: double.maxFinite,
        height: 200,
        padding: EdgeInsets.all(10),
        // color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.deepBlack,
              offset: Offset(0, 1),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextFieldUtil(
              hintText: "Amount",
              hasLabel: false,
              controller: amountCtl,
              keyboardType: TextInputType.number,
            ),
            GetBuilder<MarketingController>(
              builder: (marketingInnerCtl) {
                return SizedBox(
                  width: double.maxFinite,
                  child: CustomBtnUtil(
                    btnTitle: "now",
                    isLoading: marketingInnerCtl.isWithdrawLoading,
                    onClicked: amount.value.isNotEmpty
                        ? () async {
                            marketingInnerCtl.setIsWithdrawLoadingValue(true);
                            var payload = {
                              'amount': amount.value,
                              'input': {},
                            };
                            await withdrawBalanceHook.runMutation(payload);
                            marketingInnerCtl.setIsWithdrawLoadingValue(false);
                            //Todo: Empty the data
                            amountCtl.text = '';
                          }
                        : null,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
