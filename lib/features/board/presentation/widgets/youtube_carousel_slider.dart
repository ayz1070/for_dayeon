import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';
import 'package:for_dayeon/features/board/presentation/view_models/video_view_model.dart';
import 'youtube_item.dart';

class YoutubeCarouselSlider extends StatelessWidget {
  final List<VideoViewModel> videos;

  const YoutubeCarouselSlider({
    required this.videos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: videos.length,
      itemBuilder: (context, index, realIndex) {
        final video = videos[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: YoutubeItem(videoViewModel: video),
        );
      },
      options: CarouselOptions(
        height: 350, // 유튜브 썸네일 비율에 맞게 슬라이더 높이 조정
        viewportFraction: 0.8, // 뷰포트 크기
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        autoPlay: false,
      ),
    );
  }
}