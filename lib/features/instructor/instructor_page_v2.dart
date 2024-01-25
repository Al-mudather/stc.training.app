import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/instructor/components/courses_tab_bar_view.dart';
import 'package:stc_training/features/instructor/components/qualifications_tab_bar_view.dart';
import 'package:stc_training/features/instructor/sections/instructor_page_header_card_section.dart';
// import 'package:stc_training/features/instructor/sections/instuctor_page_body_section.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class InstructorPage extends HookWidget {
  const InstructorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    List<String> tabList = ["Information", "Courses"];
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    var tabController = useTabController(initialLength: tabList.length);
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Scaffold(
      appBar: AppBarUtil(
        barText: "Instructor info",
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: InstructorPageHeaderCardSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: _THE_tabs_bar(tabController, tabList),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            // SliverFillViewport(
            //   delegate: SliverChildBuilderDelegate(
            //     childCount: 1,
            //     (context, index) => TabBarView(
            //       controller: tabController,
            //       physics: NeverScrollableScrollPhysics(),
            //       children: [
            //         QualificationsTabBarView(),
            //         Container(
            //           height: 50,
            //           color: Colors.amber,
            //         )
            //       ],
            //     ),
            //   ),
            // )

            SliverFillRemaining(
              // hasScrollBody: false,
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  QualificationsTabBarView(),
                  CoursesTabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar _THE_tabs_bar(tabController, List<String> tabList) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      labelPadding: const EdgeInsets.only(left: 10, right: 3),
      labelColor: Colors.white,
      unselectedLabelColor: AppColors.primary,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primary,
      ),
      physics: const ClampingScrollPhysics(),
      indicatorPadding: const EdgeInsets.only(bottom: 4, top: 1),
      dividerColor: Colors.transparent,
      splashBorderRadius: BorderRadius.circular(30),
      tabs: tabList
          .map(
            (state) => Tab(
              child: Container(
                height: 41,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: AppColors.grey,
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    state,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
