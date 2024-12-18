import 'package:for_dayeon/core/utils/formatter.dart';

class BoardViewModel {
  final String? id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  BoardViewModel({
    this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    DateTime? createdAt,
    this.updatedAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  String get formattedTime => Formatter.formatHourMinute(createdAt);
  String get formattedDate => Formatter.formatYearMonthDate(createdAt);

  // 복사 메서드
  BoardViewModel copyWith({
    String? id,
    String? title,
    String? content,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return BoardViewModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
