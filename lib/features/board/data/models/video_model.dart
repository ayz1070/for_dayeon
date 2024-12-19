import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/video_entity.dart';

class VideoModel {
  final String? id;
  final String userId;
  final String coupleId;
  final String title;
  final String description;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  VideoModel({
    this.id,
    required this.userId,
    required this.coupleId,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.createdAt,
    this.updatedAt,
  });

  /// Firestore 데이터를 모델로 변환
  factory VideoModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return VideoModel(
      id: id,
      userId: map['userId'] as String,
      coupleId: map['coupleId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }


  /// Firestore 저장 형식으로 변환
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'coupleId': coupleId,
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
  /// 엔티티를 모델로 변환
  static VideoModel fromEntity(VideoEntity entity) {
    return VideoModel(
      id: entity.id,
      userId: entity.userId,
      coupleId: entity.coupleId,
      title: entity.title,
      description: entity.description,
      videoUrl: entity.videoUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }


  /// 복사 메서드
  VideoModel copyWith({
    String? id,
    String? userId,
    String? coupleId,
    String? title,
    String? description,
    String? videoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VideoModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      coupleId: coupleId ?? this.coupleId,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

extension VideoModelMapper on VideoModel {
  /// 모델을 엔티티로 변환
  VideoEntity toEntity() {
    return VideoEntity(
      id: id,
      userId: userId,
      coupleId: coupleId,
      title: title,
      description: description,
      videoUrl: videoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }


}