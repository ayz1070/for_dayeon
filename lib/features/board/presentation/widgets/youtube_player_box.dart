import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerBox extends StatelessWidget {
  final String videoUrl;

  const YoutubePlayerBox({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final youtubeController = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!);

    return Container(
      child: YoutubePlayer(
        controller: youtubeController,
        showVideoProgressIndicator: true, // 재생 진행 바 표시
        progressIndicatorColor: Colors.red,
      ),
    );
  }
}
