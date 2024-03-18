import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/utils/custom_text_util.dart';

void LOG_THE_DEBUG_DATA(
    {required messag, type = 'i', error = 'Some thing wrong'}) {
  var logger = Logger();
  switch (type) {
    case 't': // Trace log
      logger.t(messag);
      break;
    case 'd': // Debug log
      logger.d(messag);
      break;
    case 'i': // Info log
      logger.i(messag);
      break;
    case 'w': // Warning log
      logger.w(messag);
      break;
    case 'e': // Error log
      logger.e(messag);
      break;
    case 'f': // What a fatal log
      logger.f(messag);
      break;
    default:
      logger.i(messag);
  }
}

String GET_full_network_path({required String path}) {
  return '${AppConstants.FileUrl}${path}';
}

Widget RETURN_the_network_image_from_a_path({required String path}) {
  return Image.network(
    '${AppConstants.FileUrl}${path}',
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == true) {
        return const SpinKitWave(
          color: Colors.black,
        );
      }
      return child;
    },
  );
}

void SEND_a_message_to_the_user({
  backgroundColor = AppColors.successLight,
  backgroundTextColor = AppColors.deepBlack,
  required message,
  required messageLable,
  messageLableColor = Colors.white,
  IconData? icon,
  SnackPosition snackbarPosition = SnackPosition.TOP,
}) {
  Get.snackbar(
    messageLable,
    message,
    duration: const Duration(seconds: 5),
    snackPosition: snackbarPosition,
    titleText: CustomTextUtil(
      text1: messageLable,
      textColor: messageLableColor,
    ),
    icon: Icon(icon),
    backgroundColor: backgroundColor,
    colorText: backgroundTextColor,
  );
}

void SHOW_snackbar(
  String message, {
  String title = "",
  SnackPosition snackbarPosition = SnackPosition.BOTTOM,
  Duration duration = const Duration(seconds: 3),
  SnackStyle snackStyle = SnackStyle.FLOATING,
  IconData? icon,
  bool showProgressIndicator = true,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: snackbarPosition,
    duration: duration,
    snackStyle: snackStyle,
    icon: Icon(icon),
    showProgressIndicator: showProgressIndicator,
  );
}
