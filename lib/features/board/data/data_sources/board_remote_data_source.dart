import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../models/board_model.dart';
import 'board_data_source.dart';

class BoardRemoteDataSource implements BoardDataSource {
  final FirebaseFirestore firestore;
  final Logger logger = Logger();

  BoardRemoteDataSource({required this.firestore});

  /// 게시판 생성
  @override
  Future<void> saveBoard(BoardModel boardModel) async {
    final boardRef = firestore.collection('boards').doc();

    final newBoardModel = boardModel.copyWith(id: boardRef.id);
    try {
      await boardRef.set(newBoardModel.toMap());
      logger.i('saveBoard 성공, pointId : ${newBoardModel.id}');

    } catch (e) {
      throw Exception('saveBoard 실패 : $e');
    }
  }

  /// 게시판 읽기: ID로 특정 게시판 조회
  @override
  Future<BoardModel?> fetchBoardById(String boardId) async {
    try {
      final doc = await firestore.collection('boards').doc(boardId).get();
      if (!doc.exists) return null;
      return BoardModel.fromMap(doc.data()!, id: doc.id);
    } catch (e) {
      throw Exception('Failed to fetch board by ID: $e');
    }
  }

  /// 게시판 읽기: 사용자 ID로 게시판 조회
  @override
  Future<List<BoardModel>> fetchBoardsByUserId(String userId) async {
    try {
      final snapshot = await firestore
          .collection('boards')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => BoardModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch boards by user ID: $e');
    }
  }

  /// 게시판 읽기: 커플 ID로 게시판 조회
  @override
  Future<List<BoardModel>> fetchBoardsByCoupleId(String coupleId) async {
    try {
      final snapshot = await firestore
          .collection('boards')
          .where('coupleId', isEqualTo: coupleId)
          .get();
      return snapshot.docs
          .map((doc) => BoardModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch boards by couple ID: $e');
    }
  }

  /// 게시판 읽기: 모든 게시판 조회
  @override
  Future<List<BoardModel>> fetchBoards() async {
    try {
      final snapshot = await firestore.collection('boards').get();
      return snapshot.docs
          .map((doc) => BoardModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch boards: $e');
    }
  }

  /// 게시판 업데이트
  @override
  Future<void> updateBoard(BoardModel boardModel) async {
    try {
      if (boardModel.id == null) {
        throw Exception('Board ID is required for update.');
      }
      await firestore.collection('boards').doc(boardModel.id).update(boardModel.toMap());
    } catch (e) {
      throw Exception('Failed to update board: $e');
    }
  }

  /// 게시판 삭제
  @override
  Future<void> deleteBoardById(String boardId) async {
    try {
      await firestore.collection('boards').doc(boardId).delete();
    } catch (e) {
      throw Exception('Failed to delete board: $e');
    }
  }
}