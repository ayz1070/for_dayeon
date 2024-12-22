import '../../domain/entities/board_entity.dart';
import '../../domain/entities/board_type.dart';

class BoardViewModel {
  final String? id;
  final String title;
  final String content;
  final String imageUrl;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final BoardType boardType;

  BoardViewModel({
    this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.videoUrl,
    DateTime? createdAt,
    this.updatedAt,
    required this.boardType,
  }) : this.createdAt = createdAt ?? DateTime.now();

  // Entity -> ViewModel 변환
  static BoardViewModel fromEntity(BoardEntity entity) {
    return BoardViewModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      imageUrl: entity.imageUrl,
      videoUrl: entity.videoUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      boardType: entity.boardType,
    );
  }

  // ViewModel -> Entity 변환
  static BoardEntity toEntity(BoardViewModel viewModel) {
    return BoardEntity(
      id: viewModel.id!,
      title: viewModel.title,
      content: viewModel.content,
      imageUrl: viewModel.imageUrl,
      videoUrl: viewModel.videoUrl,
      createdAt: viewModel.createdAt,
      updatedAt: viewModel.updatedAt ?? DateTime.now(),
      boardType: viewModel.boardType,
    );
  }

  // 복사 메서드
  BoardViewModel copyWith({
    String? id,
    String? title,
    String? content,
    String? imageUrl,
    String? videoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    BoardType? boardType,
  }) {
    return BoardViewModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      boardType: boardType ?? this.boardType,
    );
  }
}
