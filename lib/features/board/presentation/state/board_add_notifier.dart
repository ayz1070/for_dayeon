import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board_add_state.dart';

class BoardAddNotifier extends StateNotifier<BoardAddState> {
  BoardAddNotifier() : super(BoardAddState());

  void setImage(String url) {
    state = state.copyWith(imageUrl: url);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }
}