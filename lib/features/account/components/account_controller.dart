import 'package:get/get.dart';

class AccountController extends GetxController {
  bool _isLoading = false;
  get isLoading => _isLoading;

  setIsLoadingValue(val) {
    _isLoading = val;
    update();
  }
}
