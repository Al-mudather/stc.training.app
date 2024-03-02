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
      // onError: (error) {
      //   // 1) Tell the user there somthing wrong.
      //   // var link = error!.linkException;
      //   // List<GraphQLError> graphqlErrors = error.graphqlErrors;
      //   // if (graphqlErrors.isNotEmpty) {
      //   //   for (GraphQLError e in graphqlErrors) {
      //   //     String message = e.message;
      //   //     if (message.contains("AUTHENTICATION_ERROR")) {
      //   //       //TODO: Tell the user that he is not authenticated and need to log in
      //   //       SEND_a_message_to_the_user(
      //   //         message: "You need to log in",
      //   //         messageLable: "Authentication Error",
      //   //         backgroundColor: AppColors.errorDark,
      //   //       );
      //   //     }
      //   //   }
      //   // }
      // },
    ),
  );

  // var resData = reseult.data;
  return reseult;
}
