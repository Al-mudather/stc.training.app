import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/account/graphql/account_mutations.dart';
import 'package:stc_training/helper/methods.dart';

useUpdateUserAccountMutationHook({required context}) {
  MutationHookResult action = useMutation(MutationOptions(
    document: gql(AccountMutations.UpdateUserProfileMutation),
    fetchPolicy: FetchPolicy.networkOnly,
    onCompleted: (dynamic resultData) {
      if (resultData != null) {
        // LOG_THE_DEBUG_DATA(messag: resultData, type: 'i');
        var success = resultData!['updateUserProfile']!['success'];
        if (success == true) {
          // 0) Empty the image file after the mutatiom
          // certificateCtl.emptyTheImageAfterTheMutation();
          // 1) Refresh the data.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Success')),
          );
          Get.forceAppUpdate();
          // 2) Tell the user if the data are updated succefully.
          // Send_message_to_the_user(
          //   message: "The data has been Created succefully",
          //   messageLable: "Success",
          // );
          // 3) Stop the button loader.
          // certificateCtl.setIsLoadingValue(false);
          // 4) Go back to the previous page
          // LOG_THE_DEBUG_DATA(messag: resultData, type: 'i');
        }
      }
    },
    onError: (error) {
      // 1) Tell the user there somthing wrong.
      LOG_THE_DEBUG_DATA(messag: 'Error ==> $error', type: 'e');
      // 2) Stop the button loader.
      // certificateCtl.setIsLoadingValue(false);
    },
  ));
  return action;
}
