import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/course/models/enrollment_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/title_text_util.dart';

class MyCourseCardComponent extends StatelessWidget {
  MyCourseCardComponent({
    super.key,
    required this.enrollment,
    this.width = 170,
  });
  final EnrollmentModel enrollment;
  final double width;

  @override
  Widget build(BuildContext context) {
    // LOG_THE_DEBUG_DATA(messag: enrollment);

    CourseModel? course = enrollment.course;
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routehelper.GoToClassRoomPage(
            coursePk: course!.pk.toString(),
            courseId: course!.id.toString(),
          ),
        );
      },
      child: Container(
        width: width,
        // height: 220,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _cardImage(
              imgPath: course!.cover!,
              // imgPath: "",
            ),
            const SizedBox(
              height: AppConstants.height_10,
            ),
            _cardTitle(
              title: course!.title!,
            ),
          ],
        ),
      ),
    );
  }

  BigTextUtil _cardTitle({required String title}) {
    return BigTextUtil(
      text: title,
      color: Color(0xFF292828),
      fontSize: 18,
      textAlign: TextAlign.start,
    );
  }

  Container _cardImage({required String imgPath}) {
    // LOG_THE_DEBUG_DATA(messag: imgPath.isEmpty);
    return imgPath.isEmpty
        ? Container(
            height: 131,
            child: SvgPicture.asset(
              'assets/svgs/stc-logo.svg',
              color: AppColors.primary,
            ),
          )
        : Container(
            height: 131,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: RETURN_the_network_image_from_a_path(path: imgPath),
          );
  }
}
