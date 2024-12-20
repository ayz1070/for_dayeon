import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/presentation/pages/video_add_page.dart';
import 'package:for_dayeon/features/board/presentation/state/video_state_notifier_provider.dart';
import 'package:for_dayeon/features/board/presentation/widgets/dday_card.dart';
import 'package:for_dayeon/features/board/presentation/widgets/youtube_carousel_slider.dart';
import '../../../../core/theme/text_styles.dart';
import '../state/board_state_notifier_provider.dart';
import '../widgets/board_carousel_slider.dart';
import 'board_add_page.dart';

class BoardPage extends ConsumerStatefulWidget {
  const BoardPage({super.key});

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends ConsumerState<BoardPage> {
  @override
  void initState() {
    super.initState();
    // 상태 초기화
    ref.read(boardStateNotifierProvider.notifier).loadBoards();
    ref.read(videoStateNotifierProvider.notifier).loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardStateNotifierProvider);
    final videoState = ref.watch(videoStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "공대생이라 미안해",
          style: AppTextStyles.bold16,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == '게시글') {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BoardAddPage()),
                );
              } else if (value == '영상') {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const VideoAddPage()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: '게시글', child: Text("게시글 추가")),
              const PopupMenuItem(value: '영상', child: Text("영상 추가")),
            ],
            icon: const Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // 트리의 투명도 조절
              child: Image.asset(
                'assets/images/christmas3.png', // 크리스마스 트리 이미지 경로
                fit: BoxFit.cover, // 이미지를 화면에 가득 채움
              ),
            ),
          ),

          ListView(
            children: [
              DdayCard(),
              // 게시글 섹션
              boardState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (boards) {
                  if (boards.isEmpty) {
                    return const Center(child: Text("게시물이 없습니다."));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Text("우리 애기 사진", style: AppTextStyles.bold20),
                      ),
                      BoardCarouselSlider(boards: boards),
                    ],
                  );
                },
                error: (error, stack) => Center(
                  child: Text("게시글 오류: $error"),
                ),
              ),

              // 동영상 섹션
              videoState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (videos) {
                  if (videos.isEmpty) {
                    return const Center(child: Text("동영상이 없습니다."));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Text("우리 애기 영상", style: AppTextStyles.bold20),
                      ),
                      YoutubeCarouselSlider(videos: videos),
                    ],
                  );
                },
                error: (error, stack) => Center(
                  child: Text("동영상 오류: $error"),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "누르지마",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "누르지마2",
          ),
        ],
      ),
    );
  }
}