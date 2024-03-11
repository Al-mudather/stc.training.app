import 'package:get/get.dart';
import 'package:stc_training/features/course/course_details_page.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/video_player/videoPlayerPage.dart';
import 'package:stc_training/layout/main_layout_page.dart';
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
  static const String courseDetailsPage = '/course-details-page';
  static String GoToCourseDetialsPage(
          {required String coursePk, required String courseId}) =>
      '$courseDetailsPage?coursePk=$coursePk&&courseId=$courseId';

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
