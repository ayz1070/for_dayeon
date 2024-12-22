import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';
import 'board_item.dart';

class BoardCarouselSlider extends StatelessWidget {
  final List<BoardViewModel> boards;

  const BoardCarouselSlider({
    required this.boards,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: boards.length,
      itemBuilder: (context, index, realIndex) {
        final board = boards[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BoardItem(boardViewModel: board),
        );
      },
      options: CarouselOptions(
        height: 568, // 슬라이더 전체 높이 설정
        viewportFraction: 0.75, // 뷰포트 크기
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: false,
      ),
    );
  }
}