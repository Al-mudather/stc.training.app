import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/title_text_util.dart';

class CourseCardComponent extends StatelessWidget {
  CourseCardComponent({
    super.key,
    required this.course,
    this.width = 170,
  });
  final CourseModel course;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          InkWell(
            onTap: () {
              // SHOW_snackbar(
              //   "The details page will come soon",
              //   icon: Icons.lock_clock,
              // );
              // SEND_a_message_to_the_user(
              //   message: "The details page will come soon",
              //   messageLable: "Wait",
              // );
              //TODO: Go to course details page
              Get.toNamed(
                Routehelper.GoToCourseDetialsPage(
                  coursePk: course.pk.toString(),
                  courseId: course.id.toString(),
                ),
              );
            },
            child: _cardImage(
              imgPath: course.cover!,
            ),
          ),
          _cardTitle(
            title: course.title!,
          ),
          _cardPrice(
            course: course,
          ),
        ],
      ),
    );
  }

  Row _cardPrice({required CourseModel course}) {
    var sdgPrice = "${course.courseFeeInSdg}".split('.')[0];
    var dollarPrice = "${course.courseFee}".split('.')[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBtnUtil(
          btnTitle: "",
          btnType: BtnTypes.icon,
          iconColor: AppColors.brown,
          onClicked: () => {
            //TODO: Go to shopping card
            SEND_a_message_to_the_user(
              message: "You will be able to buy soon",
              messageLable: "Shopping",
              snackbarPosition: SnackPosition.BOTTOM,
            )
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        int.parse(sdgPrice) == 0
            ? TitleTextUtil(
                firstText: dollarPrice.toString(),
                secondText: "\$",
                showMarker: false,
              )
            : TitleTextUtil(
                firstText: sdgPrice.toString(),
                secondText: "SDG",
                showMarker: false,
              )
      ],
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
