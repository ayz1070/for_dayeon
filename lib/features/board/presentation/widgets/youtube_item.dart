import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';
import 'package:for_dayeon/features/board/presentation/pages/video_detail_page.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';
import 'package:for_dayeon/features/board/presentation/view_models/video_view_model.dart';
import '../pages/board_detail_page.dart';

class YoutubeItem extends StatelessWidget {
  final VideoViewModel videoViewModel;

  const YoutubeItem({
    required this.videoViewModel,
    super.key,
  });

  String getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.parse(videoUrl);
    final videoId = uri.queryParameters['v']; // 유튜브 URL의 'v' 파라미터에서 ID 추출
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = getYoutubeThumbnail(videoViewModel.videoUrl);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoDetailPage(videoViewModel: videoViewModel),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero 애니메이션 추가
            Hero(
              tag: 'youtubeThumbnail-${videoViewModel.id}',
              child: AspectRatio(
                aspectRatio: 16 / 9, // 유튜브 썸네일 비율 16:9
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 텍스트 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 80, // 텍스트 섹션의 고정 높이
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "날짜: ${videoViewModel.createdAt}",
                      style: AppTextStyles.regular11,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      videoViewModel.title,
                      style: AppTextStyles.bold14,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}