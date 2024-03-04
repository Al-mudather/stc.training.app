import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/course_queries.dart';
import 'package:stc_training/features/course/models/course_models.dart';

UseGet_course_data_pk_query_hook({
  required context,
  required coursePk,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CourseQueries.GetSingleCourseByPkQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'coursePk': coursePk,
      },
    ),
  );

  hookRes.result.isLoading;

  var resData = hookRes.result.data;

  try {
    CourseModel? course;
    // LOG_THE_DEBUG_DATA(messag: resData);
    if (resData != null && resData.isNotEmpty) {
      course = CourseModel.fromJson(resData['course']);
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': course,
    };
  } catch (e) {}

  // LOG_THE_DEBUG_DATA(messag: resData);

  return {
    'loading': hookRes.result.isLoading,
    'data': '',
  };
}
