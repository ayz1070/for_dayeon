import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';
import 'package:for_dayeon/features/board/domain/use_cases/board_use_case.dart';

class FetchBoardsByUserIdUseCase implements BoardUseCase<List<BoardEntity>, String> {
  final BoardRepository repository;

  FetchBoardsByUserIdUseCase({required this.repository});

  @override
  Future<List<BoardEntity>> call(String userId) async {
    return await repository.fetchBoardsByUserId(userId);
  }
}