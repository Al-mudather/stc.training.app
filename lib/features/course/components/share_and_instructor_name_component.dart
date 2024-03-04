import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:share_plus/share_plus.dart';

class ShareAndInstructorNameComponent extends StatelessWidget {
  const ShareAndInstructorNameComponent({
    super.key,
    required this.course,
  });
  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    //TODO: Handle the error where there is no instructor assigned to the course
    CourseInstructorModel? mainInstructor =
        course?.instructors.firstWhere((element) {
      return element.isMainInstructor == true;
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _INSTRUCTOR_image(mainInstructor: mainInstructor),
            const SizedBox(
              width: 10,
            ),
            CustomTextUtil(
              text1:
                  "${mainInstructor?.instructor?.user?.firstName} ${mainInstructor?.instructor?.user?.lastName}",
            ),
          ],
        ),
        _SHARE_button(),
      ],
    );
  }

  Container _INSTRUCTOR_image({CourseInstructorModel? mainInstructor}) {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            color: const Color(0xFFFCC74C).withOpacity(0.5),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: (mainInstructor?.instructor?.image != null ??
                    "${mainInstructor?.instructor?.image}".isNotEmpty)
                ? RETURN_the_network_image_from_a_path(
                    path: '${mainInstructor?.instructor?.image}')
                : SvgPicture.asset(
                    'assets/svgs/stc-logo.svg',
                    color: AppColors.primary,
                    fit: BoxFit.cover,
                  ),
          ),
        ],
      ),
    );
  }

  Ink _SHARE_button() {
    return Ink(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.4),
            spreadRadius: 5,
          )
        ],
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: SvgPicture.asset(
          'assets/svgs/share.svg',
          height: 17,
          width: 17,
        ),
        onPressed: () => {
          SEND_a_message_to_the_user(
            message: "Enabled soon",
            messageLable: "Share",
            snackbarPosition: SnackPosition.BOTTOM,
          ),
          // Share.share('${course?.title}'),
        },
        alignment: Alignment.center,
      ),
    );
  }
}
