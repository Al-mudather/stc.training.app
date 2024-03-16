import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/routes/route_helper.dart';

class AuthController extends GetxController {
  final SharedPreferences appStorage;
  AuthController({required this.appStorage}) {
    String? storedToken = appStorage.getString(AppConstants.TOKEN);
    String? refreshToken = appStorage.getString(AppConstants.REFRESHTOKEN);
    var stringUser = appStorage.getString(AppConstants.USER);
    Map? user = {};
    if (stringUser != null) {
      user = jsonDecode(stringUser);
    }
    _user = (user != null) ? user : {};
    _token = (storedToken != null) ? storedToken : "";
    _refreshToken = (refreshToken != null) ? refreshToken : "";
  }

  bool _isLoading = false;
  get isLoading => _isLoading;

  Map _user = {};
  String _token = "";
  String _refreshToken = "";
  Map get user => _user;
  String get token => _token;
  String get refreshToken => _refreshToken;

  setIsLoadingValue(val) {
    _isLoading = val;
    update();
  }

  void delete_all_the_data() async {
    await appStorage.remove(AppConstants.USER);
    await appStorage.remove(AppConstants.TOKEN);
    await appStorage.remove(AppConstants.REFRESHTOKEN);
    _user = {};
    _token = "";
    _refreshToken = "";
    // Save the token to the Getx
    Get.forceAppUpdate();
  }

  void SET_CREDENTIALS({
    required Map user,
    required String token,
    required String refreshToken,
  }) async {
    //TODO: Set the user data

    //TODO: Set the token and refresh token
    _token = token;
    _refreshToken = refreshToken;
    _user = user;
    // Empty the user, token and refreshToken from the shared prefrences
    await appStorage.remove(AppConstants.USER);
    await appStorage.remove(AppConstants.TOKEN);
    await appStorage.remove(AppConstants.REFRESHTOKEN);
    //  Save the token to the shared prefrences
    appStorage.setString(AppConstants.USER, jsonEncode(user));
    appStorage.setString(AppConstants.TOKEN, token);
    appStorage.setString(AppConstants.REFRESHTOKEN, refreshToken);

    // * Pass in email provided by customer
    // OneSignal.User.addEmail(user['username']);
    // OneSignal.login(user['username']);
    // // LOG_THE_DEBUG_DATA(messag: "user: $user");

    // Save the token to the Getx
    Get.forceAppUpdate();

    // Go to the inital page
    Get.toNamed(Routehelper.GoToDrawerLayoutPage());
  }
}
