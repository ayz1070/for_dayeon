import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';

import 'board_use_case.dart';

class UpdateBoardUseCase implements BoardUseCase<void, BoardEntity> {
  final BoardRepository repository;

  UpdateBoardUseCase({required this.repository});

  @override
  Future<void> call(BoardEntity boardEntity) async {
    await repository.updateBoard(boardEntity);
  }
}