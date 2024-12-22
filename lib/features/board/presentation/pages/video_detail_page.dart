import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';
import 'package:for_dayeon/features/board/presentation/view_models/video_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatelessWidget {
  final VideoViewModel videoViewModel;

  const VideoDetailPage({required this.videoViewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoViewModel.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // 자동 재생 설정
        mute: false,    // 음소거 설정
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("영상 상세"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 유튜브 플레이어 섹션
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: youtubeController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
            ),
            const SizedBox(height: 16),

            // 제목 섹션
            Text(
              videoViewModel.title,
              style: AppTextStyles.bold16,
            ),
            const SizedBox(height: 8),

            // 날짜 섹션
            Text(
              "업로드일: ${videoViewModel.createdAt}",
              style: AppTextStyles.regular12,
            ),
            const SizedBox(height: 16),

            // 설명 섹션
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  videoViewModel.description,
                  style: AppTextStyles.regular14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}