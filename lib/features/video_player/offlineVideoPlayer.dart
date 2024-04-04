import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:video_player/video_player.dart';

class OfflineVideoPlayer extends StatefulWidget {
  const OfflineVideoPlayer({super.key, required this.localVideoPath});

  @override
  State<OfflineVideoPlayer> createState() => _OfflineVideoPlayerState();

  final String localVideoPath;
}

class _OfflineVideoPlayerState extends State<OfflineVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.file(
      File(widget.localVideoPath),
    );
    chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
        barText: "Offline video",
      ),
      body: Center(
        child: Container(
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}
