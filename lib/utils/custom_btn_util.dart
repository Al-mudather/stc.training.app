import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';

class CustomBtnUtil extends StatelessWidget {
  const CustomBtnUtil({
    super.key,
    required this.btnTitle,
    this.btnType = BtnTypes.eleveated,
    this.btnColor = AppColors.successLight,
    this.icon = const Icon(Icons.home_filled),
    this.iconFilled = AppColors.successDark,
    this.iconColor = AppColors.successDark,
    this.iconRadius = 8,
    this.radius = 20,
    this.fontSize = 14,
    this.iconSize = 20,
    this.onClicked,
    this.isLoading = false,
  });
  final String btnTitle;
  final BtnTypes btnType;
  final Color iconFilled;
  final Color btnColor;
  final Color iconColor;
  final Widget icon;
  final double iconRadius;
  final double radius;
  final double fontSize;
  final double iconSize;
  final bool isLoading;

  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    switch (btnType) {
      case BtnTypes.filledIcon:
        return Center(
          child: Ink(
            decoration: ShapeDecoration(
              color: iconFilled,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(iconRadius),
              ),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: icon,
              color: iconColor,
              onPressed: onClicked,
              alignment: Alignment.center,
            ),
          ),
        );
      case BtnTypes.icon:
        return IconButton(
          icon: icon,
          iconSize: iconSize,
          onPressed: isLoading ? () {} : onClicked,
        );
      case BtnTypes.text:
        return TextButton(
          onPressed: isLoading ? () {} : onClicked,
          child: isLoading
              ? const SpinKitWave(
                  color: Colors.white,
                )
              : Text(
                  btnTitle,
                  style: TextStyle(
                    color: btnColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        );
      case BtnTypes.textWithIcon:
        return TextButton(
          onPressed: isLoading ? () {} : onClicked,
          child: isLoading
              ? const SpinKitWave(
                  color: Colors.white,
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btnTitle,
                      style: TextStyle(
                        color: btnColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    icon,
                  ],
                ),
        );
      case BtnTypes.outlined:
        return OutlinedButton(
          onPressed: isLoading ? () {} : onClicked,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: btnColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: Text(
            btnTitle,
            style: TextStyle(
              color: btnColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case BtnTypes.eleveatedWithIcon:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? () {} : onClicked,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: isLoading
                ? const SpinKitWave(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        btnTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      icon
                    ],
                  ),
          ),
        );
      case BtnTypes.eleveated:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? () {} : onClicked,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: isLoading
                ? const SpinKitWave(
                    color: Colors.white,
                  )
                : Text(
                    btnTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? () {} : onClicked,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: isLoading
                ? const SpinKitWave(
                    color: Colors.white,
                  )
                : Text(
                    btnTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: "inter",
                    ),
                  ),
          ),
        );
    }
  }
}
