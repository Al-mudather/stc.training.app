import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/class_room/offline/components/offline_chapters_custom_tab_bar_view.dart';
import 'package:stc_training/features/class_room/sections/class_chapters_custom_tab_bar_view.dart';
import 'package:stc_training/features/class_room/sections/class_files_custom_tab_bar_view.dart';
import 'package:stc_training/features/class_room/sections/class_info_tab_bar_view.dart';
import 'package:stc_training/features/course/components/course_class_loading_page_comp.dart';
import 'package:stc_training/features/course/controller/offline_courses_controller.dart';
import 'package:stc_training/features/course/hooks/get_course_data_by_pk_hook.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/small_text_util.dart';

class OfflineClassRoomPage extends HookWidget {
  const OfflineClassRoomPage({
    super.key,
    required this.coursePk,
    required this.courseId,
  });

  final String coursePk;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    // //? Offline controller
    // final OfflineCoursesController offlineCoursectl =
    //     Get.find<OfflineCoursesController>();

    PageController pageController = usePageController(initialPage: 0);
    var current_index = useState(0);

    List tabs = ["Lessons"];
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Data
    ///////////////////////////////////////////////

    //Todo: Get all the chapters and there contents
    return Scaffold(
      appBar: AppBarUtil(barText: 'Offline Class Room Page'),
      backgroundColor: AppColors.backgroundColor,
      body: _CLASS_data(
        tabs: tabs,
        current_index: current_index,
        pageController: pageController,
      ),
    );
    // return Scaffold(
    //   appBar: AppBarUtil(barText: 'Offline Class Room Page'),
    //   backgroundColor: AppColors.backgroundColor,
    //   body: result['loading']
    //       ? CourseClassLoadingPageComp()
    //       : _CLASS_data(
    //           course: course,
    //           tabs: tabs,
    //           current_index: current_index,
    //           pageController: pageController,
    //         ),
    // );
  }

  SingleChildScrollView _CLASS_data({
    required List<dynamic> tabs,
    required ValueNotifier<int> current_index,
    required PageController pageController,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _CLASS_tabs_container(tabs, current_index, pageController),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 550,
                  padding: EdgeInsets.only(bottom: 5),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      OfflineChapterCustomTabBarView(
                        courseId: courseId,
                        coursePk: coursePk,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Container _CLASS_tabs_container(
    List<dynamic> tabs,
    ValueNotifier<int> current_index,
    PageController pageController,
  ) {
    return Container(
      // height: 50,
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: 13.5,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.grey),
          bottom: BorderSide(color: AppColors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabs.length,
          (index) => _TAB_item(
            name: tabs[index],
            index: index,
            current_index: current_index,
            pageController: pageController,
          ),
        ),
      ),
    );
  }

  GestureDetector _TAB_item({
    required String name,
    index,
    current_index,
    required PageController pageController,
  }) {
    print(name);

    return GestureDetector(
      onTap: () => {
        current_index.value = index,
        pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
        )
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        // padding: EdgeInsets.only(
        //   bottom: 13.5,
        // ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: current_index.value == index
                  ? AppColors.secondary
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: CustomBtnUtil(
          btnTitle: name,
          btnType: BtnTypes.text,
          btnColor: AppColors.grey,
        ),
        // child: SmallTextUtil(
        //   text: name,
        //   size: 13,
        // ),
      ),
    );
  }

  Row _STATISTIC_item({required String name}) {
    return Row(
      children: [
        SvgPicture.asset("assets/svgs/online_course.svg"),
        const SizedBox(
          width: 5,
        ),
        SmallTextUtil(
          text: name,
          size: 13,
        )
      ],
    );
  }
}
