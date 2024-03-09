import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/video_player/controller/video_controller.dart';
import 'package:stc_training/utils/skeleton_loading_util.dart';

class AlhasifVideoPlayerComp extends StatelessWidget {
  const AlhasifVideoPlayerComp({super.key, required this.videoUuid});

  final String videoUuid;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
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
    );
  }
}
