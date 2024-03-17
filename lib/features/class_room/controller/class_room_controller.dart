import 'package:get/get.dart';

class ClassRoomController extends GetxController {
  String _video_type = '';
  String _cipher_otp = '';
  String _cipher_play_back_info = '';
  String _alhasif_video_uuid = '';
  String _video_name = '';

  String get videoType => _video_type;
  String get cipherOtp => _cipher_otp;
  String get cipherPlayBackInfo => _cipher_play_back_info;
  String get alhasifVideoUuid => _alhasif_video_uuid;
  String get videoName => _video_name;

  void SET_video_palyer_info_data({
    required videoName,
    required videoType,
    required cipherOtp,
    required cipherPlayBackInfo,
    required alhasifVideoUuid,
  }) {
    _video_name = videoName;
    _video_type = videoType;
    _cipher_otp = cipherOtp;
    _cipher_play_back_info = _cipher_play_back_info;
    _alhasif_video_uuid = _alhasif_video_uuid;

    update();
  }
}
