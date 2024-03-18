import 'package:get/get.dart';

class ClassRoomController extends GetxController {
  var _video_type;
  var _cipher_otp;
  var _cipher_play_back_info;
  var _alhasif_video_uuid;
  var _video_name;
  bool isLoading = true;

  get videoType => _video_type;
  get cipherOtp => _cipher_otp;
  get cipherPlayBackInfo => _cipher_play_back_info;
  get alhasifVideoUuid => _alhasif_video_uuid;
  get videoName => _video_name;

  void SET_is_loading({required bool val}) {
    isLoading = val;

    update();
  }

  void SET_video_palyer_info_data({
    required videoName,
    required bool loading,
    required videoType,
    required cipherOtp,
    required cipherPlayBackInfo,
    required alhasifVideoUuid,
  }) {
    _video_name = videoName;
    _video_type = videoType;
    _cipher_otp = cipherOtp;
    _cipher_play_back_info = cipherPlayBackInfo;
    _alhasif_video_uuid = _alhasif_video_uuid;
    isLoading = loading;

    update();
  }
}
