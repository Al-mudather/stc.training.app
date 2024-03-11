import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/components/all_courses_loading_page_comp.dart';
import 'package:stc_training/features/course/hooks/get_all_courses_hook.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/home/components/course_card_component.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';

class AllCoursesPage extends HookWidget {
  const AllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> result;
    final ScrollController scrollCtl = useScrollController();
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    result = UseGet_all_courses_query_hook(context: context);
    AllCoursesModel? allcourses = result['data'];
    QueryHookResult<Object?> hookRes = result['hookRes'];

    return Scaffold(
      appBar: AppBarUtil(
        barText: "All Courses",
      ),
      body: result['loading']
          ? AllCoursesLoadingPageComp()
          : _COURSES_data(
              allcourses: allcourses,
              scrollCtl: scrollCtl,
              hookRes: hookRes,
            ),
    );
  }

  SingleChildScrollView _COURSES_data({
    AllCoursesModel? allcourses,
    required ScrollController scrollCtl,
    required QueryHookResult<Object?> hookRes,
  }) {
    var courses = allcourses!.courses;
    return SingleChildScrollView(
      controller: scrollCtl,
      child: Container(
        padding: EdgeInsets.symmetric(
          // horizontal: AppConstants.horizentalPadding,
          vertical: AppConstants.verticalPadding,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Wrap(
              runSpacing: AppConstants.height_30 / 2,
              spacing: AppConstants.height_10,
              children: List.generate(
                courses.length ?? 0,
                (index) => CourseCardComponent(course: courses[index]),
              ),
            ),
            const SizedBox(
              height: AppConstants.height_20,
            ),
            allcourses.hasNextPage == true
                ? Container(
                    width: double.maxFinite,
                    child: CustomBtnUtil(
                      btnTitle: "Load more",
                      radius: 10,
                      onClicked: () {
                        FetchMoreOptions opts = FetchMoreOptions(
                          variables: {'cursor': allcourses.endCursor},
                          updateQuery:
                              (previousResultData, fetchMoreResultData) {
                            // this function will be called so as to combine both the original and fetchMore results
                            final List<dynamic> repos = [
                              ...previousResultData!['allCourses']['edges']
                                  as List<dynamic>,
                              ...fetchMoreResultData!['allCourses']['edges']
                                  as List<dynamic>
                            ];

                            // to avoid a lot of work, lets just update the list of repos in returned
                            // data with new data, this also ensures we have the endCursor already set
                            // correctly
                            fetchMoreResultData['allCourses']['edges'] = repos;

                            return fetchMoreResultData;
                          },
                        );

                        //TODO: Call the fetch more function
                        hookRes.fetchMore(opts);
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
