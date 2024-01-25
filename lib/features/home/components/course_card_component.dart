import 'package:flutter/material.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/title_text_util.dart';

class CourseCardComponent extends StatelessWidget {
  const CourseCardComponent({
    super.key,
    this.width = 161,
  });
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
          _cardImage(),
          _cardTitle(),
          _cardPrice(),
        ],
      ),
    );
  }

  Row _cardPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBtnUtil(
          btnTitle: "",
          btnType: BtnTypes.icon,
          onClicked: () => {},
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        TitleTextUtil(
          firstText: "90k",
          secondText: "SDG",
          showMarker: false,
        )
      ],
    );
  }

  BigTextUtil _cardTitle() {
    return const BigTextUtil(
      text: "ECG interpretation course ",
      color: Color(0xFF292828),
      fontSize: 18,
      textAlign: TextAlign.start,
    );
  }

  Container _cardImage() {
    return Container(
      height: 131,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/Akashi.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
