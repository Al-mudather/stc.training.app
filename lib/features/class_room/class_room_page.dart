import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/class_room/components/class_chapter_expandable_card.dart';
import 'package:stc_training/features/class_room/sections/class_chapters_custom_tab_bar_view.dart';
import 'package:stc_training/features/class_room/sections/class_info_tab_bar_view.dart';
import 'package:stc_training/features/course_details/components/course_chapter_expandable_card.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:stc_training/utils/small_text_util.dart';

class ClassRoomPage extends HookWidget {
  const ClassRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    List<String> tabList = ["Information", "Courses"];
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    PageController pageController = usePageController(initialPage: 0);
    var current_index = useState(0);

    List tabs = ["Lessons", "Info"];
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Scaffold(
      appBar: AppBarUtil(barText: ""),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              color: Colors.amber,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextUtil(
                    text1: "ECG Interpretaion",
                    textAlign: TextAlign.center,
                    fontSize1: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CLASS_statistics(),
                  const SizedBox(
                    height: 20,
                  ),
                  _CLASS_tabs_container(tabs, current_index, pageController),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.only(bottom: 5),
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ClassChapterCustomTabBarView(),
                        ClassInfoTabBarView(),
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
      ),
    );
  }

  Row CLASS_statistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _STATISTIC_item(name: "12 Lessons"),
        _STATISTIC_item(name: "30 Hours"),
        _STATISTIC_item(name: "Certificate"),
      ],
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
