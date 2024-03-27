import 'package:get/get.dart';

class MarketingController extends GetxController {
  bool _isWithdrawLoading = false;
  get isWithdrawLoading => _isWithdrawLoading;

  bool _isBalanceLoading = false;
  get isBalanceLoading => _isBalanceLoading;

  setIsWithdrawLoadingValue(val) {
    _isWithdrawLoading = val;
    Get.forceAppUpdate();
  }

  setIsBalanceLoadingValue(val) {
    _isBalanceLoading = val;
    update();
  }
}
