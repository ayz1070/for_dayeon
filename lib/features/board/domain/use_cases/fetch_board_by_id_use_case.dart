import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';

import 'board_use_case.dart';

class FetchBoardByIdUseCase implements BoardUseCase<BoardEntity?, String> {
  final BoardRepository repository;

  FetchBoardByIdUseCase({required this.repository});

  @override
  Future<BoardEntity?> call(String boardId) async {
    return await repository.fetchBoardById(boardId);
  }
}