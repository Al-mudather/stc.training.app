import 'package:flutter/material.dart';
import 'package:stc_training/features/home/models/home_slider_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/big_text_util.dart';

class MarketingCardComponent extends StatelessWidget {
  MarketingCardComponent({super.key, required this.slider});

  final HomeSliderModel slider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SEND_a_message_to_the_user(
          message: "The details page will come soon",
          messageLable: "Wait",
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        // height: 170,
        // height: 250,
        padding: const EdgeInsets.only(top: 20, left: 23, bottom: 5),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.primaryDark,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextUtil(
                  text: '${slider.course!.title}',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                // SizedBox(
                //   // width: 200,
                //   child: Wrap(
                //     spacing: 10,
                //     runSpacing: 10,
                //     children: [
                //       _countCard(count: 12, title: 'Days'),
                //       _countCard(count: 12, title: 'Hours'),
                //       _countCard(count: 12, title: 'Minit'),
                //       // _countCard(count: 12, title: 'Seconds'),
                //     ],
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.width_20,
                    vertical: AppConstants.height_5,
                  ),
                  margin: EdgeInsets.only(bottom: AppConstants.height_5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: const BigTextUtil(
                    text: "Details",
                    color: AppColors.secondary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: -12,
              child: Image.asset(
                'assets/images/OBJECTS.png',
                height: 100,
                width: 120,
                alignment: Alignment.bottomRight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _countCard({count, required String title}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white.withOpacity(0.4),
      ),
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$count \n',
              style: const TextStyle(
                color: Color(0xFFE8EAF5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: title,
              style: const TextStyle(
                color: Color(0xFFE8EAF5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
