import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';
import 'package:for_dayeon/features/board/domain/use_cases/board_use_case.dart';

class FetchBoardsUseCase implements BoardUseCase<List<BoardEntity>, NoParams> {
  final BoardRepository repository;

  FetchBoardsUseCase({required this.repository});

  @override
  Future<List<BoardEntity>> call(NoParams params) async {
    return await repository.fetchBoards();
  }
}

class NoParams {}