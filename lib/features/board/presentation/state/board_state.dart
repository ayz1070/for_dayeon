import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardState {
  final AsyncValue<List<BoardViewModel>> boards;

  BoardState({required this.boards});

  BoardState copyWith({AsyncValue<List<BoardViewModel>>? boards}) {
    return BoardState(
      boards: boards ?? this.boards,
    );
  }

  // 초기 상태를 정의하는 정적 메서드
  static BoardState initial() {
    return BoardState(
      boards: const AsyncValue.loading(),
    );
  }
}
