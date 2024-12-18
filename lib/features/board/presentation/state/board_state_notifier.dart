import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/presentation/state/board_state.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardStateNotifier extends StateNotifier<BoardState>{
  BoardStateNotifier() : super(BoardState(boards: []));

  void loadBoards(List<BoardViewModel> boards){
    state = BoardState(boards: boards);
  }

  void addItem(String title, String content, String imageUrl){
    final newBoard = BoardViewModel(title: title, content: content, imageUrl: imageUrl);

    state = state.copyWith(boards : [...state.boards, newBoard]);
  }

  void updateItem(String id, String title, String content, String imageUrl){
    final index = state.boards.indexWhere((board) => board.id == id);
    if(index!= -1){
      final updatedBoard = state.boards[index].copyWith(
        title:title,
        content: content,
        imageUrl: imageUrl,
      );
      final updatedBoards = [...state.boards];
      updatedBoards[index] = updatedBoard;
      state = state.copyWith(boards: updatedBoards);
    }

  }

  void deleteItem(String id){
    state = state.copyWith(
      boards: state.boards.where((board) => board.id != id).toList(),
    );
  }
}