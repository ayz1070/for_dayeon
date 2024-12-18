class UserEntity{
  final String? id; // Firestore Document ID
  final String coupleId; // 커플 ID
  final String name; // 유저 이름
  final String imageUrl; // 프로필 이미지 URL
  final DateTime metAt; // 만난 날짜
  final DateTime createdAt; // 생성 날짜

  UserEntity({
    this.id, // Firestore의 Reference ID와 연동
    required this.coupleId,
    required this.name,
    required this.imageUrl,
    required this.metAt,
    required this.createdAt,
  });

}