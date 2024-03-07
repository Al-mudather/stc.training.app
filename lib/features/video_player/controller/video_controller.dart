import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  final String videoPath;

  VideoController(
      {this.videoPath = 'https://www.youtube.com/watch?v=j2ZKH72Xm04'});

  @override
  void onInit() {
    super.onInit();
    initializePlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.onClose();
  }

  // void initializePlayer() {
  //   //? Initialize the video player controller
  //   videoPlayerController = VideoPlayerController.networkUrl(
  //     Uri.parse(
  //         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  //   );
  //   //? Wait for the initialization to finish
  //   // await Future.wait([videoPlayerController.initialize()]);
  //   videoPlayerController.initialize().then(
  //         (value) => videoPlayerController.play(),
  //       );
  //   //? Play the video after been initialized
  //   videoPlayerController.play();
  //   update();
  // }
  Future<void> initializePlayer() async {
    //? Initialize the video player controller
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(videoPath),
    );
    //? Wait for the initialization to finish
    await Future.wait([videoPlayerController.initialize()]);
    //? Initialize the chewie controller
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.primary,
        handleColor: AppColors.secondary,
        backgroundColor: AppColors.backgroundColor,
        bufferedColor: AppColors.successLight,
      ),
      placeholder: Container(
        color: AppColors.primary,
      ),
      autoInitialize: true,
    );

    update();
  }
}
