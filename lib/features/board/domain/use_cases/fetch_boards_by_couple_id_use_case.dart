import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';
import 'board_use_case.dart';

class FetchBoardsByCoupleIdUseCase implements BoardUseCase<List<BoardEntity>, String> {
  final BoardRepository repository;

  FetchBoardsByCoupleIdUseCase({required this.repository});

  @override
  Future<List<BoardEntity>> call(String coupleId) async {
    return await repository.fetchBoardsByCoupleId(coupleId);
  }
}