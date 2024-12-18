import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel {
  final String? id; // Firestore Document ID
  final String coupleId; // 커플 ID
  final String name; // 유저 이름
  final String imageUrl; // 프로필 이미지 URL
  final DateTime metAt; // 만난 날짜
  final DateTime createdAt; // 생성 날짜

  UserModel({
    this.id, // Firestore의 Reference ID와 연동
    required this.coupleId,
    required this.name,
    required this.imageUrl,
    required this.metAt,
    required this.createdAt,
  });

  /// Firestore 데이터를 모델로 변환
  factory UserModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return UserModel(
      id: id,
      coupleId: map['coupleId'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      metAt: (map['metAt'] as Timestamp).toDate(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  /// 현재 모델을 Firestore 저장 가능 형식으로 변환
  Map<String, dynamic> toMap() {
    return {
      'coupleId': coupleId,
      'name': name,
      'imageUrl': imageUrl,
      'metAt': Timestamp.fromDate(metAt),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// 복사 메서드
  UserModel copyWith({
    String? id,
    String? coupleId,
    String? name,
    String? imageUrl,
    DateTime? metAt,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      coupleId: coupleId ?? this.coupleId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      metAt: metAt ?? this.metAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

/// Model과 Entity 간 변환 로직
extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      coupleId: coupleId,
      name: name,
      imageUrl: imageUrl,
      metAt: metAt,
      createdAt: createdAt,
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      coupleId: entity.coupleId,
      name: entity.name,
      imageUrl: entity.imageUrl,
      metAt: entity.metAt,
      createdAt: entity.createdAt,
    );
  }
}