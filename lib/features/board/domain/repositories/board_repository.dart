import '../entities/board_entity.dart';

abstract class BoardRepository {
  Future<void> saveBoard(BoardEntity boardEntity);
  Future<BoardEntity?> fetchBoardById(String boardId);
  Future<List<BoardEntity>> fetchBoardsByUserId(String userId);
  Future<List<BoardEntity>> fetchBoardsByCoupleId(String coupleId);
  Future<List<BoardEntity>> fetchBoards();
  Future<void> updateBoard(BoardEntity boardEntity);
  Future<void> deleteBoardById(String boardId);
}