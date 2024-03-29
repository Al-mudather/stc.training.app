import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/marketing/graphql/marketing_queries.dart';
import 'package:stc_training/features/marketing/models/pyramid_account_model.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_my_pyramid_account_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(MyMarketingQueries.MyPyramidAccountQuery),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    PyramidAccountModel? pyramidAccount;
    if (resData != null && resData.isNotEmpty) {
      pyramidAccount =
          PyramidAccountModel.fromJson(resData['myPyramidAccount']);
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': pyramidAccount,
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
