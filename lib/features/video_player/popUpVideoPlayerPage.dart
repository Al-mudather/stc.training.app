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
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.localVideoPath);
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    LOG_THE_DEBUG_DATA(messag: widget.localVideoPath);
    return Material(
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data ?? false) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}
