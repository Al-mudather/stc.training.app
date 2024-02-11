import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/home/controller/make_search_request.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/big_text_util.dart';

class SearchSection extends HookWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    TextEditingController searchCtl = useTextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    final search = useState("");
    var isLoading = useState(false);
    // var allCoursesData = useState(AllCoursesModel.init());
    final GraphQLClient client = useGraphQLClient();
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    // LOG_THE_DEBUG_DATA(messag: client);
    Make_the_search() async {
      if ("${search.value}".isNotEmpty) {
        // ? Enable the loading
        isLoading.value = true;

        QueryResult result = await MAKE_search_resuest_with_client(
          client: client,
          filters: {'title__icontains': search.value},
        );

        var resData = result.data;
        AllCoursesModel? allCourses;
        // LOG_THE_DEBUG_DATA(messag: hookRes.result);
        if (resData != null && resData.isNotEmpty) {
          allCourses = AllCoursesModel.fromJson(resData["allCourses"]);
          // LOG_THE_DEBUG_DATA(messag: resData["allCourses"]);
          // return homeSliders;

          _SHOW_result_in_bottomSheet(
            context: context,
            courses: allCourses.courses,
          );

          // ? Disable the loading
          isLoading.value = false;
        }

        // ? Disable the loading
        isLoading.value = result.isLoading;
      }
    }

    // ;

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

    // MAKE_search_request() {
    //   context.graphQLClient.query
    // }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF5F5F5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              // blurRadius: 0.1,
              spreadRadius: 0.1,
              offset: Offset(0, 0.1),
            ),
          ],
        ),
        child: TextField(
          controller: searchCtl,
          // onChanged: (value) {
          //   Make_the_search();
          // },
          decoration: InputDecoration(
            hintText: "What are you looking for ?",
            hintStyle: const TextStyle(
              color: Color(0xFF989898),
            ),
            suffixIcon: InkWell(
              onTap: () {
                Make_the_search();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: AppColors.secondary,
                ),
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  dynamic _SHOW_result_in_bottomSheet({
    required BuildContext context,
    required List<CourseModel> courses,
  }) {
    showModalBottomSheet(
      // isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          builder: (_, controller) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    // The shape
                    FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Container(
                        height: 6,
                        // width: 20,
                        margin: const EdgeInsets.only(top: 24),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // The data
                    // for (var i = 0; i < 20; i++) _searchCard(),
                    Wrap(
                      children: List.generate(
                        courses.length,
                        (index) {
                          CourseModel course = courses[index];

                          return _searchCard(
                            course: course,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _searchCard({
    required CourseModel course,
  }) {
    return Container(
      width: 345,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryDark,
              child: SvgPicture.asset("assets/svgs/glass-search.svg"),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: BigTextUtil(
                text: "${course.title}",
                color: Color(0xFF707070),
                fontSize: 20,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
