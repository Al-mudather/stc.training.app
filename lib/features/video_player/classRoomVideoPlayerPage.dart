import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stc_training/features/video_player/components/alhasif_video_player_comp.dart';
import 'package:stc_training/features/video_player/components/vdo_cipher_video_player_comp.dart';
import 'package:stc_training/utils/app_bar_util.dart';

class ClassRoomVideoPlayerPage extends StatelessWidget {
  const ClassRoomVideoPlayerPage({
    super.key,
    required this.unitContent,
    required this.videoTitle,
  });

  final String unitContent;
  final String videoTitle;

  @override
  Widget build(BuildContext context) {
    //TODO: Get the course unit content string and convert it to model
    var contant = jsonDecode(unitContent);
    // //? Get the content data
    // var contentData = jsonDecode('${contant!["modelValue"]}');
    // //? Get the Video type
    var video_type = contant["video_type"];
    var cipherOtp = contant["cipherOtp"];
    var videoUuid = contant["videoUuid"];
    var playbackInfo = contant["playbackInfo"];

    return Scaffold(
      appBar: AppBarUtil(
        barText: videoTitle ?? '',
      ),
      // body: YoYoPlayer(
      //   // aspectRatio: 16 / 9,
      //   url:
      //       'https://video.cdn1.stc.training/stream/hls/${videoUuid}/playlist.m3u8',
      //   videoStyle: VideoStyle(
      //     qualityStyle: TextStyle(
      //       fontSize: 16.0,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.white,
      //     ),
      //     forwardAndBackwardBtSize: 30.0,
      //     playButtonIconSize: 40.0,
      //     playIcon: Icon(
      //       Icons.add_circle_outline_outlined,
      //       size: 40.0,
      //       color: Colors.white,
      //     ),
      //     pauseIcon: Icon(
      //       Icons.remove_circle_outline_outlined,
      //       size: 40.0,
      //       color: Colors.white,
      //     ),
      //     videoQualityPadding: EdgeInsets.all(5.0),
      //   ),
      // )
      // body: AlhasifVideoPlayerComp(videoUuid: videoUuid),
      body: (video_type == 'TYPE_HASIF')
          ? AlhasifVideoPlayerComp(videoUuid: videoUuid)
          : VdoCihperVideoPlayerComp(
              otp: cipherOtp,
              playbackInfo: playbackInfo,
            ),
    );
  }
}
