import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/class_room/components/class_chapter_expandable_card.dart';
import 'package:stc_training/features/class_room/offline/components/offline_chapter_expandable_card.dart';
import 'package:stc_training/features/course/controller/offline_courses_controller.dart';
import 'package:stc_training/features/course/hooks/get_all_units_data_by_course_pk_hook.dart';
import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/services/CRUD/offline_unit_model.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class OfflineChapterCustomTabBarView extends HookWidget {
  const OfflineChapterCustomTabBarView({
    super.key,
    required this.courseId,
    required this.coursePk,
  });
  final String courseId;
  final String coursePk;
  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    //? Offline controller
    final OfflineCoursesController offlineCoursectl =
        Get.find<OfflineCoursesController>();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    List<OfflineUnitModel>? courseUnits = [];
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    //TODO: All Course Units
    // unitsResult = UseGet_all_units_data_pk_course_query_hook(
    //   context: context,
    //   courseId: courseId,
    // );
    // //? Get the course units data
    // AllCourseUnitsModel? courseUnits = unitsResult["data"];
    // QueryHookResult<Object?> hookRes = unitsResult['hookRes'];
    try {
      final snapShot = useFuture(useMemoized(() => offlineCoursectl
          .getAllOfflineCourseUnitsWithData(coursePk: coursePk)));
      courseUnits = snapShot.data;
    } catch (e) {}

    return courseUnits?.length == 0
        ? SkeletonLoadingUtil(child: Course_chapters_loading())
        : (courseUnits != null
            ? _CLASS_chapters_data(courseUnits: courseUnits)
            : Container());
  }

  SingleChildScrollView _CLASS_chapters_data({
    required List<OfflineUnitModel> courseUnits,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            runSpacing: 2,
            children: List.generate(
              courseUnits?.length ?? 0,
              (index) => OfflineChapterExpandableCard(
                unit: courseUnits[index],
              ),
            ),
          ),
          const SizedBox(
            height: AppConstants.height_20,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView Course_chapters_loading() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              15,
              (index) => Container(
                width: double.infinity,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
