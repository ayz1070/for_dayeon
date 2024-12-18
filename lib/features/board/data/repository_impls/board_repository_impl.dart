import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';
import '../data_sources/board_data_source.dart';
import '../models/board_model.dart';

class BoardRepositoryImpl implements BoardRepository {
  final BoardDataSource dataSource;

  BoardRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveBoard(BoardEntity boardEntity) async {
    final model = BoardModelMapper.fromEntity(boardEntity);
    await dataSource.saveBoard(model);
  }

  @override
  Future<BoardEntity?> fetchBoardById(String boardId) async {
    final model = await dataSource.fetchBoardById(boardId);
    return model?.toEntity();
  }

  @override
  Future<List<BoardEntity>> fetchBoardsByUserId(String userId) async {
    final models = await dataSource.fetchBoardsByUserId(userId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<BoardEntity>> fetchBoardsByCoupleId(String coupleId) async {
    final models = await dataSource.fetchBoardsByCoupleId(coupleId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<BoardEntity>> fetchBoards() async {
    final models = await dataSource.fetchBoards();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateBoard(BoardEntity boardEntity) async {
    final model = BoardModelMapper.fromEntity(boardEntity);
    await dataSource.updateBoard(model);
  }

  @override
  Future<void> deleteBoardById(String boardId) async {
    await dataSource.deleteBoardById(boardId);
  }
}