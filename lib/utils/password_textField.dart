import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.hasLabel = true,
    this.errorMessage = "This field is required",
    this.keyboardType = TextInputType.text,
    this.btnColor = AppColors.purple,
    this.iconPadding = 16,
    this.radius = 12,
    this.maxLines = 1,
    this.prefixIcon,
    this.enable = true,
  });
  final double radius;
  final String errorMessage;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color btnColor;
  final bool enable;
  final bool hasLabel;
  final int maxLines;
  final Widget? prefixIcon;
  final double iconPadding;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool passwordVisible;
  late bool isPassword;
  @override
  void initState() {
    setState(() {
      passwordVisible = false;
      isPassword = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
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
          widget.hasLabel
              ? CustomTextUtil(
                  text1: widget.label,
                  fontSize1: 16,
                  hasAnotherText: false,
                  fontWeight1: FontWeight.w700,
                )
              : Container(
                  height: 0.1,
                ),
          widget.hasLabel
              ? const SizedBox(
                  height: 5,
                )
              : Container(
                  height: 0.1,
                ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15,
                top: 15,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              // border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabled: widget.enable,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(widget.iconPadding),
                      child: widget.prefixIcon,
                    )
                  : widget.prefixIcon,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                    isPassword = !isPassword;
                  });
                },
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blacklight3,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.errorMessage;
              }
              return null;
            },
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            obscureText: isPassword,
          )
        ],
      ),
    );
  }
}
