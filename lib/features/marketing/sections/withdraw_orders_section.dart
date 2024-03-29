import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/components/withdraw_card_component.dart';
import 'package:stc_training/features/marketing/hooks/get_my_withdraws_hook.dart';
import 'package:stc_training/features/marketing/models/withdraw_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/no_data_util.dart';
import 'package:stc_training/utils/section_title_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class WithdrawOrdersSection extends HookWidget {
  const WithdrawOrdersSection({super.key});

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
    result = UseGet_my_withdraws_query_hook(
      context: context,
    );
    //? Get the course data
    AllWithdrawsModel? withdraws = result['data'];
    QueryHookResult<Object?> hookRes = result['hookRes'];
    List<WithdrawModel>? allwithdraws = withdraws?.wihthdraws;
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
        result['loading']
            ? The_loading()
            : (withdraws == null
                ? The_loading()
                : allwithdraws!.length > 0
                    ? The_data(
                        allwithdraws: withdraws,
                        hookRes: hookRes,
                      )
                    : NoDataUtil(
                        text: "No withdrawals yet!",
                      ))
      ],
    );
  }

  SkeletonLoadingUtil The_loading() {
    return SkeletonLoadingUtil(
      child: Column(
        children: List.generate(
          5,
          (index) => Container(
            height: 50,
            color: Colors.amber,
            margin: EdgeInsets.only(top: 20),
          ),
        ),
      ),
    );
  }

  Container The_data({
    AllWithdrawsModel? allwithdraws,
    required QueryHookResult<Object?> hookRes,
  }) {
    // LOG_THE_DEBUG_DATA(messag: allwithdraws);
    return Container(
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
      child: Column(
        children: [
          Wrap(
            runSpacing: 10,
            children: List.generate(
              allwithdraws?.wihthdraws.length ?? 0,
              (index) {
                WithdrawModel? withdraw = allwithdraws?.wihthdraws[index];

                if (withdraw != null) {
                  return WithDrawCardComponent(
                    cardLabel: withdraw.isDone == true ? "Paied" : "Waiting",
                    withdrawDate:
                        "${FORMAT_THE_DATE(stringDate: withdraw.created)}",
                    imgPath: withdraw.isDone == true
                        ? "assets/svgs/done_status.svg"
                        : "assets/svgs/waiting_status.svg",
                    amount: "${withdraw.amount}",
                  );
                }

                return Container();
              },
            ),
          ),
          const SizedBox(
            height: AppConstants.height_20,
          ),
          allwithdraws?.hasNextPage == true
              ? Container(
                  width: double.maxFinite,
                  child: CustomBtnUtil(
                    btnTitle: "Load more",
                    radius: 10,
                    onClicked: () {
                      FetchMoreOptions opts = FetchMoreOptions(
                        variables: {'cursor': allwithdraws?.endCursor},
                        updateQuery: (previousResultData, fetchMoreResultData) {
                          // this function will be called so as to combine both the original and fetchMore results
                          final List<dynamic> repos = [
                            ...previousResultData!['myPyramidWithdraws']
                                ['edges'] as List<dynamic>,
                            ...fetchMoreResultData!['myPyramidWithdraws']
                                ['edges'] as List<dynamic>
                          ];

                          // to avoid a lot of work, lets just update the list of repos in returned
                          // data with new data, this also ensures we have the endCursor already set
                          // correctly
                          fetchMoreResultData['myPyramidWithdraws']['edges'] =
                              repos;

                          return fetchMoreResultData;
                        },
                      );

                      //TODO: Call the fetch more function
                      hookRes.fetchMore(opts);
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
