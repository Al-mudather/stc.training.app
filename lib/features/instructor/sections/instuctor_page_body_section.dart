import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/helper/app_colors.dart';

class InstructorPageBodySection extends HookWidget {
  const InstructorPageBodySection({super.key});

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

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _THE_tabs_bar(tabController, tabList),
        )
      ],
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     _THE_tabs_bar(tabController, tabList),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //     // TabBarView(
    //     //   controller: tabController,
    //     //   children: [
    //     //     QualificationsTabBarView(),
    //     //     SizedBox(
    //     //       height: 30,
    //     //     )
    //     //   ],
    //     // )
    //   ],
    // );
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
