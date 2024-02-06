import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerLayoutController extends GetxController {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    // zoomDrawerController.toggle?.call();
    zoomDrawerController.toggle?.call();
    update();
  }
}
