import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/video_player/controller/video_controller.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';

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
    LOG_THE_DEBUG_DATA(messag: '44444444444444444444444444444');
    LOG_THE_DEBUG_DATA(messag: metaData);
    LOG_THE_DEBUG_DATA(messag: '44444444444444444444444444444');
    LOG_THE_DEBUG_DATA(messag: videoUuid);
    LOG_THE_DEBUG_DATA(messag: '44444444444444444444444444444');

    return Scaffold(
      appBar: AppBarUtil(
        barText: "Free Video",
      ),
      body: GetBuilder<VideoController>(
        init: VideoController(
          videoPath: videoPath,
        ),
        builder: (videoCtl) {
          return (videoCtl.chewieController != null &&
                  videoCtl.chewieController!.videoPlayerController.value
                      .isInitialized)
              ? Chewie(controller: videoCtl.chewieController!)
              : Text("Error");
          // return (videoCtl.chewieController != null &&
          //         videoCtl.chewieController!.videoPlayerController.value
          //             .isInitialized)
          //     ? Chewie(controller: videoCtl.chewieController!)
          //     : Text("Error");
        },
      ),
    );
  }
}
