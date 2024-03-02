import 'package:get/get.dart';
import 'package:stc_training/features/course/course_details_page.dart';
import 'package:stc_training/layout/main_layout_page.dart';

class Routehelper {
  ///////////////////////////////////////////////
  /// Main Layout page
  ///////////////////////////////////////////////
  static const String mainLayoutPage = '/main-layout-page';
  static String GoToMainLayoutPage() => mainLayoutPage;
  ///////////////////////////////////////////////
  /// Course details page
  ///////////////////////////////////////////////
  static const String courseDetailsPage = '/course-details-page';
  static String GoToCourseDetialsPage({required String coursePk}) =>
      '$courseDetailsPage?coursePk=$coursePk';

  ////////////////////////////////////////////
  // ? Route Lists
  ////////////////////////////////////////////
  static List<GetPage> routes = [
    // ? Main Layout Page
    GetPage(
      name: mainLayoutPage,
      page: () => MainLayoutPage(),
    ),

    // ? Course details page
    GetPage(
      name: courseDetailsPage,
      page: () {
        var coursePk = Get.parameters["coursePk"];
        return CourseDetailsPage(coursePk: coursePk!);
      },
    )
  ];
}
