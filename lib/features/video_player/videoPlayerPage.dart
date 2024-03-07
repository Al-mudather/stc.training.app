import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/video_player/controller/video_controller.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({
    super.key,
    required this.videoPath,
    required this.unitContent,
  });

  final String videoPath;
  final String unitContent;

  @override
  Widget build(BuildContext context) {
    //TODO: Get the course unit content string and convert it to model
    var contant = jsonDecode(unitContent);
    //? Get the content data
    var contentData = jsonDecode('${contant!["modelValue"]}');
    //? Get the Video type
    var video_type = contentData["video_type"];
    //? Get the Meta data
    var metaData = contentData!['video_metadata'];
    var videoUuid;
    if (video_type == 'TYPE_HASIF') {
      videoUuid = metaData['videoData']['videoUuid'];
    }
    //TODO: Extract the video type [ viemo, vdoCipher, stcServer ]
    //TODO: Based on the type load the correct player

    return Scaffold(
      appBar: AppBarUtil(
        barText: "Free Video",
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
      body: GetBuilder<VideoController>(
        init: VideoController(
          videoPath:
              'https://video.cdn1.stc.training/stream/hls/${videoUuid}/playlist.m3u8',
        ),
        builder: (videoCtl) {
          return (videoCtl.chewieController != null &&
                  videoCtl.chewieController!.videoPlayerController.value
                      .isInitialized)
              ? Chewie(controller: videoCtl.chewieController!)
              : Center(
                  child: SkeletonLoadingUtil(
                    child: Container(
                      height: 300,
                      color: Colors.white,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
