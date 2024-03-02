import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/home/graphql/home_slider_queries.dart';
import 'package:stc_training/features/home/models/home_slider_models.dart';
import 'package:stc_training/helper/methods.dart';

UseGet_all_home_sliders_query_hook({
  required context,
}) {
  QueryHookResult<Object?> hookRes = useQuery(
    QueryOptions(
      document: gql(HomeSliderQueries.GETAllHomePageSlidersQuery),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: {
        'orderBy': ["-pk"],
      },
      onError: (error) {
        // 1) Tell the user there somthing wrong.
        // var link = error!.linkException;
        List graphqlErrors = error!.graphqlErrors;
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
  AllHomeSlidersModel? homeSliders;
  // LOG_THE_DEBUG_DATA(messag: hookRes.result);
  if (resData != null && resData.isNotEmpty) {
    homeSliders = AllHomeSlidersModel.fromJson(resData["allHomePageSliders"]);
    // LOG_THE_DEBUG_DATA(messag: homeSliders.homeSliders);
    // return homeSliders;
  }

  return {
    'loading': hookRes.result.isLoading,
    'data': homeSliders,
  };
}
