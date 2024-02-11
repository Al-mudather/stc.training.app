import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/course_queries.dart';

Future<QueryResult> MAKE_search_resuest_with_client({
  required GraphQLClient client,
  filters,
}) async {
  var queryFilters = jsonEncode({
    'course_fee_in_sdg__gt': 0,
    ...filters,
  });

  QueryResult reseult = await client.query(
    QueryOptions(
      document: gql(CourseQueries.GETAllCoursesQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'orderBy': ["-pk"],
        'first': 10,
        'filters': queryFilters,
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
      },
    ),
  );

  // var resData = reseult.data;
  return reseult;
}
