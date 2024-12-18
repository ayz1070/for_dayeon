import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';

import 'board_use_case.dart';

class SaveBoardUseCase implements BoardUseCase<void, BoardEntity> {
  final BoardRepository repository;

  SaveBoardUseCase({required this.repository});

  @override
  Future<void> call(BoardEntity boardEntity) async {
    await repository.saveBoard(boardEntity);
  }
}