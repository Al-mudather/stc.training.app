import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/class_room/components/class_chapter_expandable_card.dart';
import 'package:stc_training/features/course/hooks/get_all_units_data_by_course_pk_hook.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class ClassChapterCustomTabBarView extends HookWidget {
  const ClassChapterCustomTabBarView({super.key, required this.courseId});
  final String courseId;
  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> unitsResult;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    //TODO: All Course Units
    unitsResult = UseGet_all_units_data_pk_course_query_hook(
      context: context,
      courseId: courseId,
    );
    //? Get the course units data
    AllCourseUnitsModel? courseUnits = unitsResult["data"];
    QueryHookResult<Object?> hookRes = unitsResult['hookRes'];

    return unitsResult['loading']
        ? SkeletonLoadingUtil(child: Course_chapters_loading())
        : courseUnits != null
            ? _CLASS_chapters_data(courseUnits: courseUnits, hookRes: hookRes)
            : SkeletonLoadingUtil(child: Course_chapters_loading());
  }

  SingleChildScrollView _CLASS_chapters_data({
    AllCourseUnitsModel? courseUnits,
    required QueryHookResult<Object?> hookRes,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            runSpacing: 2,
            children: List.generate(
              courseUnits?.courseUnits.length ?? 0,
              (index) => ClassChapterExpandableCard(
                unit: courseUnits?.courseUnits[index],
              ),
            ),
          ),
          const SizedBox(
            height: AppConstants.height_20,
          ),
          courseUnits!.hasNextPage == true
              ? Container(
                  width: double.maxFinite,
                  child: CustomBtnUtil(
                    btnTitle: "Load more",
                    radius: 10,
                    onClicked: () {
                      FetchMoreOptions opts = FetchMoreOptions(
                        variables: {'cursor': courseUnits!.endCursor},
                        updateQuery: (previousResultData, fetchMoreResultData) {
                          // this function will be called so as to combine both the original and fetchMore results
                          final List<dynamic> repos = [
                            ...previousResultData!['allCourseUnits']['edges']
                                as List<dynamic>,
                            ...fetchMoreResultData!['allCourseUnits']['edges']
                                as List<dynamic>
                          ];

                          // to avoid a lot of work, lets just update the list of repos in returned
                          // data with new data, this also ensures we have the endCursor already set
                          // correctly
                          fetchMoreResultData['allCourseUnits']['edges'] =
                              repos;

                          return fetchMoreResultData;
                        },
                      );

                      //TODO: Call the fetch more function
                      hookRes.fetchMore(opts);
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  SingleChildScrollView Course_chapters_loading() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              15,
              (index) => Container(
                width: double.infinity,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
