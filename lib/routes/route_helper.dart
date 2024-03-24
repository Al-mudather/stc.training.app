import 'package:get/get.dart';
import 'package:stc_training/features/class_room/class_room_page.dart';
import 'package:stc_training/features/course/all_courses_page.dart';
import 'package:stc_training/features/course/course_details_page.dart';
import 'package:stc_training/features/course/my_courses_page.dart';
import 'package:stc_training/features/pdf/pdf_screen.dart';
import 'package:stc_training/features/video_player/classRoomVideoPlayerPage.dart';
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
  static const String myCoursesPage = '/my-courses-page';
  static String GoToCourseDetialsPage(
          {required String coursePk, required String courseId}) =>
      '$courseDetailsPage?coursePk=$coursePk&&courseId=$courseId';
  static String GoToAllCoursesPage(
          {String? categoryPk, String? categoryName}) =>
      '$allCoursesPage?categoryPk=$categoryPk&&categoryName=$categoryName';
  static String GoToMyCoursesPage() => myCoursesPage;

  ///////////////////////////////////////////////
  /// Course class page
  ///////////////////////////////////////////////
  static const String classRoomPage = '/class-room-page';
  static String GoToClassRoomPage({
    required String coursePk,
    required String courseId,
  }) =>
      '$classRoomPage?coursePk=$coursePk&&courseId=$courseId';

  ///////////////////////////////////////////////
  /// The Pdf Screen page
  ///////////////////////////////////////////////
  static const String pdfScreenPage = '/pdfScreen';
  static String goToPdfScreenPage({required path}) =>
      '$pdfScreenPage?path=$path';

  ///////////////////////////////////////////////
  /// Video Player page
  ///////////////////////////////////////////////
  static const String videoPlayerPage = '/video-player-page';
  static const String classRoomVideoPlayerPage =
      '/class-room-video-player-page';
  static String GoToVideoPlayerPage({
    required String unitContent,
  }) =>
      '$videoPlayerPage?unitContent=$unitContent';
  static String GoToClassRoomVideoPlayerPage({
    required String unitContent,
    required String videoTitle,
  }) =>
      '$classRoomVideoPlayerPage?unitContent=$unitContent&&videoTitle=$videoTitle';
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
      page: () {
        var categoryPk = Get.parameters["categoryPk"];
        var categoryName = Get.parameters["categoryName"];
        return AllCoursesPage(
          categoryPk: categoryPk,
          categoryName: categoryName,
        );
      },
    ),
    // ? My Courses page
    GetPage(
      name: myCoursesPage,
      page: () => MyCoursesPage(),
    ),

    // ? 2 - The Pdf Screen page
    GetPage(
      name: pdfScreenPage,
      page: () {
        var path = Get.parameters["path"];
        return PDFScreen(path: path!);
      },
    ),

    // ? Course details page
    GetPage(
      name: classRoomPage,
      page: () {
        var coursePk = Get.parameters['coursePk'];
        var courseId = Get.parameters['courseId'];
        return ClassRoomPage(coursePk: coursePk!, courseId: courseId!);
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
        }),
    // ? Class Room Video Player Page
    GetPage(
        name: classRoomVideoPlayerPage,
        page: () {
          var unitContent = Get.parameters['unitContent'];
          var videoTitle = Get.parameters['videoTitle'];
          return ClassRoomVideoPlayerPage(
            videoTitle: videoTitle!,
            unitContent: unitContent!,
          );
        })
  ];
}
