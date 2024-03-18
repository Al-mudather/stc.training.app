import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_training/features/authentication/controller/auth_controller.dart';
import 'package:stc_training/features/class_room/controller/class_room_controller.dart';
import 'package:stc_training/features/settings/controller/drawer_layout_controller.dart';
import 'package:stc_training/features/shopping/controller/shopping_cart_controller.dart';

Future<void> init() async {
  // - initialize the shared preferences storage
  final sharedPreferences = await SharedPreferences.getInstance();
  // - load the shared preferences storage using getx
  Get.lazyPut(() => sharedPreferences, fenix: true);
  // Load the Auth Controller
  Get.lazyPut(() => AuthController(appStorage: Get.find()), fenix: true);
  Get.lazyPut(() => ClassRoomController(), fenix: true);
  Get.lazyPut(
    () => DrawerLayoutController(),
  );
  Get.lazyPut(
    () => ShoppingCartController(),
  );
}
