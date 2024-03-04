import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class CourseInstructorCardComponent extends StatelessWidget {
  const CourseInstructorCardComponent(
      {super.key, required this.courseInstructor});

  final CourseInstructorModel? courseInstructor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.brown.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _INSTRUCTOR_image(courseInstructor: courseInstructor),
          const SizedBox(
            width: 10,
          ),
          CustomTextUtil(
            text1:
                "Dr.${courseInstructor?.instructor?.user?.firstName} ${courseInstructor?.instructor?.user?.lastName} \n",
            fontSize1: 14,
            fontWeight1: FontWeight.w600,
            hasAnotherText: true,
            text2: "Instructor",
            fontSize2: 12,
            fontWeight2: FontWeight.w400,
            text2Color: AppColors.primary,
          ),
          Spacer(),
          CustomBtnUtil(
            btnTitle: "more",
            btnType: BtnTypes.textWithIcon,
            btnColor: AppColors.primary,
            onClicked: () => {
              SEND_a_message_to_the_user(
                message: "The details page will come soon",
                messageLable: "Wait",
              )
            },
            icon: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                "assets/svgs/yellow_left_arrow.svg",
                width: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _INSTRUCTOR_image({CourseInstructorModel? courseInstructor}) {
    LOG_THE_DEBUG_DATA(messag: courseInstructor?.instructor?.image);

    return Container(
      height: 60,
      width: 60,
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
            child: (courseInstructor?.instructor?.image != null &&
                    "${courseInstructor?.instructor?.image}".isNotEmpty)
                ? RETURN_the_network_image_from_a_path(
                    path: '${courseInstructor?.instructor?.image}')
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
}
