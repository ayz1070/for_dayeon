import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardState {
  final List<BoardViewModel> boards;

  BoardState({required this.boards});

  BoardState copyWith({List<BoardViewModel>? boards}) {
    return BoardState(
      boards: boards ?? this.boards,
    );
  }
}