import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/components/course_chapter_expandable_card.dart';
import 'package:stc_training/features/course/hooks/get_all_units_data_by_course_pk_hook.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/section_title_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class CourseChaptersSection extends HookWidget {
  CourseChaptersSection({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    """ 
      TODO: 1) Create a new page for the free video player
      TODO: 2) When the user clicks on view the free video
        navigate to the page and play the intendet video
    """;

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
    // LOG_THE_DEBUG_DATA(messag: courseUnits);

    return unitsResult['loading']
        ? SkeletonLoadingUtil(child: Course_chapters_loading())
        : Column(
            children: [
              SectionTitleUtil(secondText: "Course Chapters"),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 2,
                children: List.generate(
                  courseUnits?.courseUnits.length ?? 0,
                  (index) => CourseChapterExpandableCard(
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
                            updateQuery:
                                (previousResultData, fetchMoreResultData) {
                              // this function will be called so as to combine both the original and fetchMore results
                              final List<dynamic> repos = [
                                ...previousResultData!['allCourseUnits']
                                    ['edges'] as List<dynamic>,
                                ...fetchMoreResultData!['allCourseUnits']
                                    ['edges'] as List<dynamic>
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
          );
  }

  Column Course_chapters_loading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 10.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            5,
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
    );
  }
}
