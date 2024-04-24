import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Pause the video before popping the screen
        if (_controller.value.isPlaying) {
          _controller.pause();
        }
        return true;
      },
      child: Scaffold(
        body: Center(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            progressColors: const ProgressBarColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
            ),
            onReady: () {
              _controller.addListener(() {
                // Add listener
              });
            },
          ),
        ),
      ),
    );
  }
}
