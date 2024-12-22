class BoardAddState {
  final String? imageUrl;
  final String title;
  final String content;

  BoardAddState({
    this.imageUrl,
    this.title = "",
    this.content = "",
  });

  BoardAddState copyWith({
    String? imageUrl,
    String? title,
    String? content,
  }) {
    return BoardAddState(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}