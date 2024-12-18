import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';

import 'board_use_case.dart';

class DeleteBoardByIdUseCase implements BoardUseCase<void, String> {
  final BoardRepository repository;

  DeleteBoardByIdUseCase({required this.repository});

  @override
  Future<void> call(String boardId) async {
    await repository.deleteBoardById(boardId);
  }
}