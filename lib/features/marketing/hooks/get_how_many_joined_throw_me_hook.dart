import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/graphql/marketing_queries.dart';

UseGet_how_many_joined_throw_me_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(MyMarketingQueries.MyPyramidAffiliates),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    var count = 0;
    // LOG_THE_DEBUG_DATA(messag: resData);
    if (resData != null && resData.isNotEmpty) {
      count = resData['myPyramidAffiliates'];
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': count,
    };
  } catch (e) {}

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': 0,
  };
}
