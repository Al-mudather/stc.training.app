import 'package:get/get.dart';

class MarketingController extends GetxController {
  bool _isWithdrawLoading = false;
  get isWithdrawLoading => _isWithdrawLoading;

  setIsWithdrawLoadingValue(val) {
    _isWithdrawLoading = val;
    update();
  }
}
