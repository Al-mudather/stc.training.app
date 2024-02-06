import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';

class CustomBtnUtil extends StatelessWidget {
  const CustomBtnUtil({
    super.key,
    required this.btnTitle,
    this.btnTitleColor = Colors.white,
    this.btnType = BtnTypes.eleveated,
    this.btnColor = AppColors.primary,
    this.icon = const Icon(Icons.home_filled),
    this.iconFilled = AppColors.successDark,
    this.iconColor = AppColors.successDark,
    this.iconRadius = 8,
    this.radius = 20,
    this.fontSize = 14,
    this.iconSize = 20,
    this.onClicked,
    this.isLoading = false,
    this.loadingColor = Colors.white,
  });
  final String btnTitle;
  final Color btnTitleColor;
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
  final Color loadingColor;

  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    switch (btnType) {
      case BtnTypes.gradientBtn:
        return ElevatedButton(
          onPressed: isLoading ? null : onClicked,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF52CFCB),
                  Color(0xFF149EE2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              // width: 200,
              // height: 20,
              alignment: Alignment.center,
              child: isLoading
                  ? const SpinKitWave(
                      color: Colors.white,
                    )
                  : Text(
                      btnTitle,
                      style: TextStyle(
                        color: btnTitleColor,
                        fontSize: fontSize,
                      ),
                    ),
            ),
          ),
        );
      case BtnTypes.gradientBtnWithIcon:
        return ElevatedButton(
          onPressed: isLoading ? null : onClicked,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF52CFCB),
                  Color(0xFF149EE2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              // width: 200,
              // height: 50,
              alignment: Alignment.center,
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
                            color: btnTitleColor,
                            fontSize: fontSize,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        icon
                      ],
                    ),
            ),
          ),
        );
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
          color: iconColor,
          iconSize: iconSize,
          onPressed: isLoading ? () {} : onClicked,
        );
      case BtnTypes.text:
        return TextButton(
          onPressed: isLoading ? () {} : onClicked,
          child: isLoading
              ? SpinKitWave(
                  color: loadingColor,
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
              ? SpinKitWave(
                  color: loadingColor,
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
                ? SpinKitWave(
                    color: loadingColor,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        btnTitle,
                        style: TextStyle(
                          color: btnTitleColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                ? SpinKitWave(
                    color: loadingColor,
                  )
                : Text(
                    btnTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: btnTitleColor,
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
                ? SpinKitWave(
                    color: loadingColor,
                  )
                : Text(
                    btnTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: btnTitleColor,
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
