import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/course_queries.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_all_courses_with_filters_query_hook({
  required context,
  filters,
}) {
  var queryFilters = jsonEncode({
    'course_fee_in_sdg__gt': 0,
    ...filters,
  });

  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CourseQueries.GETAllCoursesQuery),
      // fetchPolicy: FetchPolicy.networkOnly,
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

        // LOG_THE_DEBUG_DATA(messag: error, type: 'e');

        // SHOW_THE_ERRORS(link);
      },
    ),
  );

  hookRes.result.isLoading;

  var resData = hookRes.result.data;
  AllCoursesModel? allCourses;
  LOG_THE_DEBUG_DATA(messag: resData);
  if (resData != null && resData.isNotEmpty) {
    allCourses = AllCoursesModel.fromJson(resData["allCourses"]);
    // LOG_THE_DEBUG_DATA(messag: allCourses.allCourses);
    // return allCourses;
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': allCourses,
  };
}
