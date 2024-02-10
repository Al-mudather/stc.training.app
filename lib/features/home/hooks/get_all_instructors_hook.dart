import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/instructor/graphql/instructor_queries.dart';
import 'package:stc_training/features/instructor/models/instructor_models.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_all_instructors_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(InstructorQueries.GETAllInstructorsQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'orderBy': ["-pk"],
      },
      onError: (error) {
        // 1) Tell the user there somthing wrong.
        var link = error!.linkException;
        List graphqlErrors = error.graphqlErrors;
        if (graphqlErrors != null) {
          GraphQLError gr = graphqlErrors[0];
          String message = gr.message;
          // LOG_THE_DEBUG_DATA(messag: message, type: 'e');
          if (message.contains("AUTHENTICATION_ERROR")) {
            //GO to login page
            // Get.toNamed(RouteHelper.accountLoginPage);
          }
        }

        // LOG_THE_DEBUG_DATA(messag: error, type: 'e');

        // SHOW_THE_ERRORS(link);
      },
    ),
  );

  hookRes.result.isLoading;

  var resData = hookRes.result.data;
  AllInstructorsModel? allinstructors;
  // LOG_THE_DEBUG_DATA(messag: hookRes.result);
  if (resData != null && resData.isNotEmpty) {
    allinstructors = AllInstructorsModel.fromJson(resData["allInstructors"]);
    // LOG_THE_DEBUG_DATA(messag: allinstructors.allInstructors);
    // return allinstructors;
  }

  return {
    'loading': hookRes.result.isLoading,
    'data': allinstructors,
  };
}
