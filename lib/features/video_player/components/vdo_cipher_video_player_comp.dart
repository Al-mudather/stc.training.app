import 'package:flutter/material.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:vdocipher_flutter/vdocipher_flutter.dart';

class VdoCihperVideoPlayerComp extends StatelessWidget {
  const VdoCihperVideoPlayerComp({
    super.key,
    required this.otp,
    required this.playbackInfo,
  });

  final String otp;
  final String playbackInfo;

  @override
  Widget build(BuildContext context) {
    LOG_THE_DEBUG_DATA(messag: 'OTP: => $otp');
    LOG_THE_DEBUG_DATA(messag: 'playbackInfo: => $playbackInfo');

    EmbedInfo embedInfo = EmbedInfo.streaming(
      otp: otp,
      playbackInfo: playbackInfo,
      embedInfoOptions: EmbedInfoOptions(
        autoplay: true,
        nativeControls: true,
      ),
    );

    // return VdoPlaybackView(
    //   controls: false,
    //   embedInfo: embedInfo,
    // );
    return VdoPlayer(
      embedInfo: embedInfo,
      onError: _onVdoError,
      onPlayerCreated: (controller) {},
      controls: true,
    );
  }

  _onVdoError(VdoError vdoError) {
    print("Oops, the system encountered a problem: ${vdoError.message}");
    SEND_a_message_to_the_user(
      message: "Oops, the system encountered a problem: ${vdoError.message}",
      messageLable: "Error",
    );
  }
}
