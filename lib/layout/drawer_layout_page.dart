import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/settings/controller/drawer_layout_controller.dart';
import 'package:stc_training/features/settings/menu_drawer_page.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/layout/main_layout_page.dart';

class DrawerLayoutPage extends GetView<DrawerLayoutController> {
// class DrawerLayoutPage extends StatelessWidget {
  const DrawerLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressedTime;
    return WillPopScope(
      onWillPop: () async {
        // LOG_THE_DEBUG_DATA(messag: Get.currentRoute);
        bool shouldPreventPop =
            Get.currentRoute == '/drawer-layout-page' ? false : true;

        // // If the condition is met, prevent back navigation
        // return shouldPreventPop;
        DateTime now = DateTime.now();
        // If the last back button press was within 2 seconds, exit the app
        if (lastPressedTime == null ||
            now.difference(lastPressedTime!) > Duration(seconds: 2)) {
          lastPressedTime = now;
          Get.snackbar(
            "Exite",
            "Press twice to exite",
            colorText: Colors.white,
            backgroundColor: Colors.black,
          );
          return false; // Prevent default back navigation
        } else {
          // LOG_THE_DEBUG_DATA(messag: 'Twice');
          Get.until((route) {
            if (route.isFirst) {
              SystemNavigator.pop();
            }
            return route.isFirst;
          });
          // return true;
        }
        return shouldPreventPop; // Allow back navigation
      },
      child: GetBuilder<DrawerLayoutController>(
        builder: (_ctl) => ZoomDrawer(
          controller: _ctl.zoomDrawerController,
          menuScreen: MenuDrawerPage(),
          mainScreen: MainLayoutPage(),
          mainScreenScale: 0.1,
          slideWidth: 295,
          angle: 0,
          borderRadius: 40,
          menuBackgroundColor: AppColors.primary,
        ),
      ),
    );
  }
}
