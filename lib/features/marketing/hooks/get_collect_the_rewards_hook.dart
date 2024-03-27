import 'dart:convert';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/controller/marketing_controller.dart';
import 'package:stc_training/features/marketing/graphql/marketing_mutations.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';

MarketingController marketingCtl = Get.find<MarketingController>();

useCollectTheRewoardsMutationHook({required context}) {
  var action = useMutation(MutationOptions(
    document: gql(MarketingMutations.CollectTheRewardsMutation),
    fetchPolicy: FetchPolicy.networkOnly,
    onCompleted: (dynamic resultData) {
      if (resultData != null) {
        // LOG_THE_DEBUG_DATA(messag: resultData, type: 'i');
        var success = resultData!['claimPyramidLedgerBalance']!['success'];
        var errors = resultData!['claimPyramidLedgerBalance']!['errors'];
        if (success == true) {
          // Stop the button loader.
          marketingCtl.setIsBalanceLoadingValue(false);
          SEND_a_message_to_the_user(
            message: "The rewards collected succefuly",
            messageLable: "Success",
          );
        } else if (errors != null) {
          // Stop the button loader.
          marketingCtl.setIsBalanceLoadingValue(false);
          Map messages = jsonDecode(errors["message"]);

          messages.entries.forEach((message) {
            var msgValue = message.value;
            if (msgValue.runtimeType == List) {
              List listMsgValue = msgValue as List;
              listMsgValue.asMap().map(
                (key, value) {
                  SEND_a_message_to_the_user(
                    message: "${value!['message']}",
                    messageLable: "Error",
                    backgroundColor: AppColors.errorDark,
                    backgroundTextColor: Colors.white,
                  );
                  LOG_THE_DEBUG_DATA(messag: value);
                  if ('${value!['code']}'.contains("password_mismatch")) {
                    SEND_a_message_to_the_user(
                      message: "${value!['message']}",
                      messageLable: "Error",
                      backgroundColor: AppColors.errorDark,
                      backgroundTextColor: Colors.white,
                    );
                  }
                  return value;
                },
              );
            }
          });
        }
      }
    },
    onError: (error) {
      // 1) Tell the user there somthing wrong.
      LOG_THE_DEBUG_DATA(messag: 'Error ==> $error', type: 'e');
      var link = error!.linkException;
      // 2) Stop the button loader.
      marketingCtl.setIsBalanceLoadingValue(false);
    },
  ));
  return action;
}
