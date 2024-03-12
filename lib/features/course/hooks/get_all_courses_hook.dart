import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/course_queries.dart';
import 'package:stc_training/features/course/models/course_models.dart';

UseGet_all_courses_query_home_page_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CourseQueries.GETAllCoursesQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'orderBy': ["pk"],
        'first': 10,
        'filters': jsonEncode(
          {'course_fee_in_sdg__gt': 0},
        ),
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
  // LOG_THE_DEBUG_DATA(messag: hookRes.result);
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

UseGet_all_courses_query_hook({
  required context,
  String search = '',
}) {
  Map filters = {
    'course_fee_in_sdg__gt': 0,
  };
  if (search.isNotEmpty) {
    filters['title__icontains'] = search;
  }
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CourseQueries.GETAllCoursesQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'orderBy': ["pk"],
        'first': 10,
        'cursor': '',
        'filters': jsonEncode(filters),
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

  var resData = hookRes.result.data;
  AllCoursesModel? allCourses;
  // LOG_THE_DEBUG_DATA(messag: hookRes.result);
  if (resData != null && resData.isNotEmpty) {
    allCourses = AllCoursesModel.fromJson(resData["allCourses"]);
    // LOG_THE_DEBUG_DATA(messag: allCourses.allCourses);
    // return allCourses;
  }

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': allCourses,
    'hookRes': hookRes
  };
}
