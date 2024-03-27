import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/graphql/marketing_queries.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_my_rewards_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(MyMarketingQueries.MyPyramidLedgerRewardQuery),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    var rewards = 0.0;
    if (resData != null && resData.isNotEmpty) {
      rewards = resData['myPyramidLedgerReward'];
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': rewards,
    };
  } catch (e) {
    LOG_THE_DEBUG_DATA(messag: e, type: 'e');
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': 0,
  };
}
