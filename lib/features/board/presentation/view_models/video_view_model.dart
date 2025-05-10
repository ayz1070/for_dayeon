import '../../domain/entities/video_entity.dart';

class VideoViewModel {
  final String? id;
  final String userId;
  final String coupleId;
  final String title;
  final String description;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  VideoViewModel({
    this.id,
    required this.userId,
    required this.coupleId,
    required this.title,
    required this.description,
    required this.videoUrl,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Entity -> ViewModel 변환
  static VideoViewModel fromEntity(VideoEntity entity) {
    return VideoViewModel(
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

  // ViewModel -> Entity 변환
  static VideoEntity toEntity(VideoViewModel viewModel) {
    return VideoEntity(
      id: viewModel.id,
      userId: viewModel.userId,
      coupleId: viewModel.coupleId,
      title: viewModel.title,
      description: viewModel.description,
      videoUrl: viewModel.videoUrl,
      createdAt: viewModel.createdAt,
      updatedAt: viewModel.updatedAt,
    );
  }

  // 복사 메서드
  VideoViewModel copyWith({
    String? id,
    String? userId,
    String? coupleId,
    String? title,
    String? description,
    String? videoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VideoViewModel(
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