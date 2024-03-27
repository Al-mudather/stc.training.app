import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/graphql/marketing_queries.dart';
import 'package:stc_training/features/marketing/models/withdraw_model.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_my_withdraws_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(MyMarketingQueries.MyPyramidWithdrawsQuery),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    AllWithdrawsModel? withdraws;
    LOG_THE_DEBUG_DATA(messag: resData);
    if (resData != null && resData.isNotEmpty) {
      withdraws = AllWithdrawsModel.fromJson(resData['myPyramidWithdraws']);
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': withdraws,
    };
  } catch (e) {
    LOG_THE_DEBUG_DATA(messag: e, type: 'e');
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': null,
  };
}
