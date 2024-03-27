import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        color: Colors.white,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        //   boxShadow: [
        //     BoxShadow(
        //       color: AppColors.deepBlack,
        //       offset: Offset(0, 0),
        //       blurRadius: 10,
        //     )
        //   ],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextFieldUtil(
              hintText: "Amount",
              hasLabel: false,
              controller: amountCtl,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              width: double.maxFinite,
              child: CustomBtnUtil(
                btnTitle: "now",
                onClicked: amount.value.isNotEmpty ? () {} : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
