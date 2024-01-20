import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.errorMessage = "This field is required",
    this.isPassword = false,
    this.hasLabel = true,
    this.enable = true,
    this.maxLines = 1,
    this.icon,
  });
  final String errorMessage;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool hasLabel;
  final bool enable;
  final int maxLines;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasLabel
              ? CustomText(
                  text1: label,
                  fontSize1: 16,
                  hasAnotherText: false,
                  fontWeight1: FontWeight.w700,
                )
              : Container(),
          const SizedBox(
            height: 5,
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
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.greylight),
              ),
              enabled: enable,
              suffixIcon: icon,
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
