import 'package:get/get.dart';
import 'package:stc_training/features/shopping/controller/shopping_cart_controller.dart';

Future<void> init() async {
  Get.lazyPut(
    () => ShoppingCartController(),
  );
}
