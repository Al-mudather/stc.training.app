import 'package:flutter/material.dart';
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
    return GetBuilder<DrawerLayoutController>(
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
    );
  }
}
