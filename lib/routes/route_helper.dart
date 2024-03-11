import 'package:get/get.dart';
import 'package:stc_training/features/course/all_courses_page.dart';
import 'package:stc_training/features/course/course_details_page.dart';
import 'package:stc_training/features/video_player/videoPlayerPage.dart';
import 'package:stc_training/layout/drawer_layout_page.dart';

class Routehelper {
  ///////////////////////////////////////////////
  /// Main Layout page
  ///////////////////////////////////////////////
  static const String drawerLayoutPage = '/drawer-layout-page';
  static String GoToDrawerLayoutPage() => drawerLayoutPage;
  ///////////////////////////////////////////////
  /// Course details page
  ///////////////////////////////////////////////
  static const String allCoursesPage = '/all-courses-page';
  static const String courseDetailsPage = '/course-details-page';
  static String GoToCourseDetialsPage(
          {required String coursePk, required String courseId}) =>
      '$courseDetailsPage?coursePk=$coursePk&&courseId=$courseId';
  static String GoToAllCoursesPage() => allCoursesPage;

  ///////////////////////////////////////////////
  /// Video Player page
  ///////////////////////////////////////////////
  static const String videoPlayerPage = '/video-player-page';
  static String GoToVideoPlayerPage({
    required String unitContent,
  }) =>
      '$videoPlayerPage?unitContent=$unitContent';
  ////////////////////////////////////////////
  // ? Route Lists
  ////////////////////////////////////////////
  static List<GetPage> routes = [
    // ? Main Layout Page
    GetPage(
      name: drawerLayoutPage,
      page: () => DrawerLayoutPage(),
      // page: () => MainLayoutPage(),
    ),

    // ? Course details page
    GetPage(
      name: courseDetailsPage,
      page: () {
        var coursePk = Get.parameters["coursePk"];
        var courseId = Get.parameters["courseId"];
        return CourseDetailsPage(
          coursePk: coursePk!,
          courseId: courseId!,
        );
      },
    ),

    // ? All Courses page
    GetPage(
      name: allCoursesPage,
      page: () => AllCoursesPage(),
    ),

    // ? Video Player Page
    GetPage(
        name: videoPlayerPage,
        page: () {
          var unitContent = Get.parameters['unitContent'];
          return VideoPlayerPage(
            unitContent: unitContent!,
          );
        })
  ];
}
