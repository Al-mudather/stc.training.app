import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/controller/offline_courses_controller.dart';
import 'package:stc_training/features/course/online_my_courses_page.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class OnlineOfflineMyCoursesPage extends HookWidget {
  const OnlineOfflineMyCoursesPage({
    super.key,
    this.isPage = true,
  });

  final bool isPage;

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    final OfflineCoursesController offlineCoursectl =
        Get.find<OfflineCoursesController>();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////
    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    // offlineCoursectl.deleteMyDatabase();
    useEffect(() {
      // Open database on mount
      offlineCoursectl.open();
      // Close database on dispose
      return () => offlineCoursectl.close();
    }, []);

    return Scaffold(
      appBar: isPage
          ? AppBarUtil(
              barText: "My Courses",
            )
          : null,
      body: OnlineMyCoursesPage(
        isPage: false,
      ),
    );
  }
}
