import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/marketing/hooks/get_my_pyramid_account_hook.dart';
import 'package:stc_training/features/marketing/models/pyramid_account_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class MyMarketingCodeSection extends HookWidget {
  const MyMarketingCodeSection({super.key});

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

    result = UseGet_my_pyramid_account_query_hook(
      context: context,
    );
    // LOG_THE_DEBUG_DATA(messag: searchCtl.text);
    PyramidAccountModel? pyramidAccount = result['data'];
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          GestureDetector(
            onTap: pyramidAccount != null
                ? () {
                    Clipboard.setData(
                        ClipboardData(text: '${pyramidAccount?.pyramidCode}'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Your code wase copied to clipboard')),
                    );
                  }
                : null,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.primary,
              ),
              child: SvgPicture.asset("assets/svgs/copy.svg"),
            ),
          ),
          Spacer(),
          CustomTextUtil(
            text1: "${pyramidAccount?.pyramidCode ?? 'My Code'} ",
            fontSize1: 27,
            textColor: AppColors.dark,
          )
        ],
      ),
    );
  }
}
