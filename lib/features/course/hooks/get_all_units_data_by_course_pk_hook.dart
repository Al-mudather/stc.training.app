import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/graphql/course_unit_queries.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_all_units_data_pk_course_query_hook({
  required context,
  required courseId,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CourseUnitQueries.GetAllCourseUnitsByCourseQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'courseID': courseId,
      },
    ),
  );

  var resData = hookRes.result.data;

  try {
    AllCourseUnitsModel? courseUnits;
    // LOG_THE_DEBUG_DATA(messag: resData);
    if (resData != null && resData.isNotEmpty) {
      courseUnits = AllCourseUnitsModel.fromJson(resData['allCourseUnits']);
    }

    return {
      'loading': hookRes.result.isLoading,
      'data': courseUnits,
    };
  } catch (e) {
    LOG_THE_DEBUG_DATA(messag: e, type: 'e');
  }

  return {
    'loading': hookRes.result.isLoading,
    'data': null,
  };
}
