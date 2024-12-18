import '../models/board_model.dart';

abstract class BoardDataSource {
  /// 게시판 생성
  Future<void> saveBoard(BoardModel boardModel);

  /// 게시판 읽기
  Future<BoardModel?> fetchBoardById(String boardId);
  Future<List<BoardModel>> fetchBoardsByUserId(String userId);
  Future<List<BoardModel>> fetchBoardsByCoupleId(String coupleId);
  Future<List<BoardModel>> fetchBoards();

  /// 게시판 업데이트
  Future<void> updateBoard(BoardModel boardModel);

  /// 게시판 삭제
  Future<void> deleteBoardById(String boardId);
}