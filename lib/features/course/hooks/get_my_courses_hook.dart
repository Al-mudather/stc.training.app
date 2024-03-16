import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/enrollment_queries.dart';
import 'package:stc_training/features/course/models/enrollment_models.dart';

UseGet_my_courses_query_home_page_hook({
  required context,
  String search = '',
}) {
  Map filters = {};

  if (search.isNotEmpty) {
    filters['course__title__icontains'] = search;
  }

  var variables = {
    'orderBy': ["pk"],
    'limit': 10,
    'cursor': '',
  };

  if (filters.keys.length > 0) {
    variables['filters'] = jsonEncode(filters);
  }

  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(EnrollmentQueries.GETAllEnrollmentsForCurrentUserQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: variables,
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
  AllEnrollmentsModel? allEnrollments;
  // LOG_THE_DEBUG_DATA(messag: hookRes.result);
  if (resData != null && resData.isNotEmpty) {
    allEnrollments =
        AllEnrollmentsModel.fromJson(resData["allEnrollmentsForCurrentUserV2"]);
    // LOG_THE_DEBUG_DATA(messag: allEnrollments.allEnrollments);
    // return allEnrollments;
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': allEnrollments,
    'hookRes': hookRes
  };
}
