import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class CustomTextFieldUtil extends StatelessWidget {
  const CustomTextFieldUtil({
    super.key,
    this.label = "",
    this.radius = 12,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.errorMessage = "This field is required",
    this.isPassword = false,
    this.hasLabel = true,
    this.enable = true,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.iconPadding = 16,
  });

  final double radius;
  final String errorMessage;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool hasLabel;
  final bool enable;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 0.5,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasLabel
              ? CustomTextUtil(
                  text1: label,
                  fontSize1: 16,
                  hasAnotherText: false,
                  fontWeight1: FontWeight.w700,
                )
              : Container(
                  height: 0.1,
                ),
          hasLabel
              ? const SizedBox(
                  height: 5,
                )
              : Container(
                  height: 0.1,
                ),
          TextFormField(
            controller: controller,
            // maxLines: null,
            // minLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              // isDense: true,
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15,
                top: 15,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              // border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(radius),
              //   borderSide: const BorderSide(
              //     color: AppColors.greylight,
              //   ),
              // ),
              enabled: enable,
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: suffixIcon,
                    )
                  : suffixIcon,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: prefixIcon,
                    )
                  : prefixIcon,
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            },
            maxLines: maxLines,
            keyboardType: keyboardType,
            obscureText: isPassword,
          )
        ],
      ),
    );
  }
}
