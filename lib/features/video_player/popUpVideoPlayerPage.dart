import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:video_player/video_player.dart';

class PopUpVideoPlayerPage extends StatefulWidget {
  const PopUpVideoPlayerPage({super.key, required this.localVideoPath});

  @override
  PopUpVideoPlayerPageState createState() => PopUpVideoPlayerPageState();

  final String localVideoPath;
}

class PopUpVideoPlayerPageState extends State<PopUpVideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    // _videoPlayerController = VideoPlayerController.asset(widget.localVideoPath);
    _videoPlayerController =
        VideoPlayerController.file(File(widget.localVideoPath));
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
    LOG_THE_DEBUG_DATA(messag: widget.localVideoPath);
    return Material(
      child: Center(
        child: Container(
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}
