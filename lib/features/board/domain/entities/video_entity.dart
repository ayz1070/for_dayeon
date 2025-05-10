class VideoEntity {
  final String? id;
  final String userId;
  final String coupleId;
  final String title;
  final String description;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  VideoEntity({
    this.id,
    required this.userId,
    required this.coupleId,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.createdAt,
    this.updatedAt,
  });
}