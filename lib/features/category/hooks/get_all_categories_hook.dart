import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/category/graphql/category_queries.dart';
import 'package:stc_training/features/category/models/category_models.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_all_categories_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(CategoryQueries.GETAllCourseSpecialitiesQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      // variables: {
      //   'orderBy': ["pk"],
      //   'first': 10,
      //   'filters': jsonEncode(
      //     {'course_fee_in_sdg__gt': 0},
      //   ),
      // },
      onError: (error) {
        // 1) Tell the user there somthing wrong.
        var link = error!.linkException;
        List graphqlErrors = error.graphqlErrors;
        if (graphqlErrors != null) {
          GraphQLError gr = graphqlErrors[0];
          String message = gr.message;
          if (message.contains("AUTHENTICATION_ERROR")) {
            //GO to login page
            // Get.toNamed(RouteHelper.accountLoginPage);
          }
        }
      },
    ),
  );

  hookRes.result.isLoading;

  var resData = hookRes.result.data;
  AllCategoriesModel? allCourseCategories;
  LOG_THE_DEBUG_DATA(messag: hookRes.result);

  if (resData != null && resData.isNotEmpty) {
    allCourseCategories =
        AllCategoriesModel.fromJson(resData["allCourseSpecialities"]);
  }

  return {
    'loading': hookRes.result.isLoading,
    'data': allCourseCategories,
  };
}
