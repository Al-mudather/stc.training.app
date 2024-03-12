import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/components/all_courses_loading_page_comp.dart';
import 'package:stc_training/features/course/hooks/get_all_courses_hook.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/home/components/course_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/search_text_field_util.dart';

class AllCoursesPage extends HookWidget {
  const AllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    final ScrollController scrollCtl = useScrollController();
    TextEditingController searchCtl = useTextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> result;
    var search = useState("");
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    useEffect(() {
      searchCtl.addListener(() {
        search.value = searchCtl.text;
      });

      return null;
    }, [
      searchCtl,
    ]);

    result = UseGet_all_courses_query_hook(
      context: context,
      search: search.value,
    );
    // LOG_THE_DEBUG_DATA(messag: searchCtl.text);
    AllCoursesModel? allcourses = result['data'];
    QueryHookResult<Object?> hookRes = result['hookRes'];

    return Scaffold(
      appBar: AppBarUtil(
        barText: "All Courses",
      ),
      body: SingleChildScrollView(
        controller: scrollCtl,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: SearchTextFieldUtil(
                      controller: searchCtl,
                      hideSearchIcon: true,
                      onClicked: () {},
                    ),
                  ),
                  const SizedBox(
                    width: AppConstants.height_5,
                  ),
                  search.value.isNotEmpty
                      ? CustomBtnUtil(
                          btnTitle: '',
                          btnType: BtnTypes.filledIcon,
                          radius: 50,
                          iconRadius: 50,
                          iconFilled: AppColors.redLight,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onClicked: () {
                            searchCtl.text = '';
                            // Stop the keyboard focus
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        )
                      : Container(
                          width: 0.1,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: AppConstants.height_10,
            ),
            result['loading']
                ? AllCoursesLoadingPageComp()
                : (allcourses == null
                    ? AllCoursesLoadingPageComp()
                    : _COURSES_data(
                        allcourses: allcourses,
                        scrollCtl: scrollCtl,
                        hookRes: hookRes,
                      )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        // Set the icon of the button
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        // Set the action of the button
        onPressed: () {
          // Use the animateTo method to scroll to the top
          scrollCtl.animateTo(
            scrollCtl.position.minScrollExtent, // The offset to scroll to
            duration:
                const Duration(seconds: 1), // The duration of the animation
            curve: Curves.easeOut, // The curve of the animation
          );
        },
      ),
    );
  }

  Container _COURSES_data({
    AllCoursesModel? allcourses,
    required ScrollController scrollCtl,
    required QueryHookResult<Object?> hookRes,
  }) {
    var courses = allcourses!.courses;
    return Container(
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
                        updateQuery: (previousResultData, fetchMoreResultData) {
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
    );
  }
}
