import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/graphql/marketing_queries.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_my_balance_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(MyMarketingQueries.MyPyramidBalance),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    var balance = 0.0;
    if (resData != null && resData.isNotEmpty) {
      balance = resData['myPyramidBalance']['balance'];
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': balance,
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
