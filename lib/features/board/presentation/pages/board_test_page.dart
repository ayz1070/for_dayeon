import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/data/data_sources/video_data_source_provider.dart';
import 'package:for_dayeon/features/board/data/models/board_model.dart';
import 'package:for_dayeon/features/board/data/models/video_model.dart';
import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/entities/board_type.dart';
import 'package:for_dayeon/features/board/data/data_sources/board_data_source_provider.dart';
import 'package:for_dayeon/features/board/domain/use_cases/board_use_case_provider.dart';
import 'package:for_dayeon/features/board/domain/use_cases/fetch_boards_use_case.dart';
import 'package:for_dayeon/features/board/presentation/pages/board_page.dart';

import '../../../../core/test/test_data.dart';

class BoardTestPage extends ConsumerStatefulWidget {
  const BoardTestPage({super.key});

  @override
  ConsumerState<BoardTestPage> createState() => _BoardTestPageState();
}

class _BoardTestPageState extends ConsumerState<BoardTestPage> {
  final String userId = TestData.loginUser.id!;
  final String coupleId = TestData.loginUser.coupleId;

  @override
  Widget build(BuildContext context) {
    // Riverpod 의존성 주입
    final dataSource = ref.read(boardDataSourceProvider);
    final saveBoardUseCase = ref.read(saveBoardUseCaseProvider);
    final fetchBoardsUseCase = ref.read(fetchBoardsUseCaseProvider);

    final videoDataSource = ref.read(videoDataSourceProvider);


    final boardModel = BoardModel(
      userId: userId,
      title: "테스트 제목",
      content: "테스트 내용",
      imageUrl: "https://picsum.photos/200/300",
      videoUrl: "",
      createdAt: DateTime.now(),
      boardType: BoardType.daily,
    );

    final boardEntity = BoardEntity(
      userId: userId,
      title: "엔티티 제목",
      content: "엔티티 내용",
      imageUrl: "https://picsum.photos/200/300",
      videoUrl: "",
      createdAt: DateTime.now(),
      boardType: BoardType.daily,
    );

    final videoModel = VideoModel(userId: userId, coupleId: coupleId, title: "테스트 제목", description: "테스트 소개글", videoUrl: "https://www.youtube.com/watch?v=T8yxf74MMXE", createdAt: DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text("게시판 테스트")),
      body: ListView(
        children: [
          const Text("게시판", style: TextStyle(fontSize: 20)),


          OutlinedButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoardPage(),),);
            },
            child: const Text("게시판 화면 이동"),
          ),

          Text("데이터 소스"),
          OutlinedButton(
            onPressed: () async {
              await dataSource.saveBoard(boardModel);
              showSnackBar(context, "게시글 저장 완료!");
            },
            child: const Text("saveBoard"),
          ),

          OutlinedButton(
            onPressed: () async {
              await videoDataSource.saveVideo(videoModel);
              showSnackBar(context, "비디오 저장 완료!");
            },
            child: const Text("saveVideo"),
          ),

          OutlinedButton(
            onPressed: () async {
              final boards = await dataSource.fetchBoards();
              showSnackBar(context, "${boards.first.id}");
            },
            child: const Text("fetchBoards"),
          ),
          Divider(),
          Text("유스케이스"),
          OutlinedButton(
            onPressed: () async {
              final board = await saveBoardUseCase.call(boardEntity);
              showSnackBar(context, "유스케이스 저장 성공!");
            },
            child: const Text("saveBoardUseCase"),
          ),

          OutlinedButton(
            onPressed: () async {
              final boards = await fetchBoardsUseCase.call(NoParams());
              showSnackBar(context, "${boards.first.id}");
            },
            child: const Text("fetchBoards"),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }
}