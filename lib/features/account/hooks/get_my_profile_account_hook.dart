import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/account/graphql/account_queries.dart';
import 'package:stc_training/features/account/models/user_models.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_my_profile_account_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(AccountQueries.MyProfileAccountQuery),
      // fetchPolicy: FetchPolicy.networkOnly,
    ),
  );

  var resData = hookRes.result.data;

  try {
    UserModel? myAccount;
    if (resData != null && resData.isNotEmpty) {
      myAccount = UserModel.fromJson(resData['me']);
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': myAccount,
      'hookRes': hookRes,
    };
  } catch (e) {
    LOG_THE_DEBUG_DATA(messag: e, type: 'e');
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': null,
    'hookRes': hookRes,
  };
}
