import 'board_type.dart';

class BoardEntity{
  final String? id; // Firestore Document ID
  final String userId; // 작성자 ID
  final String title; // 제목
  final String content; // 내용
  final String imageUrl; // 이미지 URL
  final String videoUrl; // 비디오 URL
  final DateTime createdAt; // 생성일
  final DateTime? updatedAt; // 수정일
  final DateTime? deletedAt; // 삭제일
  final BoardType boardType; // 게시글 타입

  BoardEntity({
    this.id, // Firestore의 Reference ID와 연동
    required this.userId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.videoUrl,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.boardType,
  });
}