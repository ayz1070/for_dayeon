import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/board_type.dart';
import '../../domain/entities/board_entity.dart';

class BoardModel {
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

  BoardModel({
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

  /// Firestore 데이터를 모델로 변환
  factory BoardModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return BoardModel(
      id: id,
      userId: map['userId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      videoUrl: map['videoUrl'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      deletedAt: map['deletedAt'] != null
          ? (map['deletedAt'] as Timestamp).toDate()
          : null,
      boardType: _stringToBoardType(map['boardType'] as String),
    );
  }

  /// 현재 모델을 Firestore 저장 가능 형식으로 변환
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'deletedAt': deletedAt != null ? Timestamp.fromDate(deletedAt!) : null,
      'boardType': boardType.toString().split('.').last, // Enum 문자열 저장
    };
  }

  /// 복사 메서드
  BoardModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    String? imageUrl,
    String? videoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    BoardType? boardType,
  }) {
    return BoardModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      boardType: boardType ?? this.boardType,
    );
  }

  /// 문자열을 BoardType으로 변환
  static BoardType _stringToBoardType(String type) {
    switch (type) {
      case 'daily':
        return BoardType.daily;
      case 'travel':
        return BoardType.travel;
      case 'food':
        return BoardType.food;
      default:
        throw Exception('Unknown BoardType: $type');
    }
  }
}

/// Model과 Entity 간 변환 로직
extension BoardModelMapper on BoardModel {
  BoardEntity toEntity() {
    return BoardEntity(
      id: id,
      userId: userId,
      title: title,
      content: content,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      boardType: boardType,
    );
  }

  static BoardModel fromEntity(BoardEntity entity) {
    return BoardModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      content: entity.content,
      imageUrl: entity.imageUrl,
      videoUrl: entity.videoUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      boardType: entity.boardType,
    );
  }
}