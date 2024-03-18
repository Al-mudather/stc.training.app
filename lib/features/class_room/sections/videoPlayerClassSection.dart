import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/class_room/controller/class_room_controller.dart';
import 'package:stc_training/features/video_player/components/alhasif_video_player_comp.dart';
import 'package:stc_training/features/video_player/components/vdo_cipher_video_player_comp.dart';
import 'package:stc_training/helper/methods.dart';

class VideoPlayerClassSection extends StatelessWidget {
  const VideoPlayerClassSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassRoomController>(
      builder: (innerClassRoomCtl) {
        LOG_THE_DEBUG_DATA(
            messag: 'is loading => ${innerClassRoomCtl.isLoading}', type: 'd');
        return innerClassRoomCtl.isLoading
            ? Center(
                child: Text('Video is loading...'),
              )
            : ((innerClassRoomCtl.videoType == 'TYPE_HASIF')
                ? AlhasifVideoPlayerComp(
                    videoUuid: innerClassRoomCtl.alhasifVideoUuid)
                : VdoCihperVideoPlayerComp(
                    otp: innerClassRoomCtl.cipherOtp,
                    playbackInfo: innerClassRoomCtl.cipherPlayBackInfo,
                  ));
      },
    );
  }
}
