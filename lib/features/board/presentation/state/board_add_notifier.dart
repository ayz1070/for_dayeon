import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/domain/entities/board_entity.dart';
import 'package:for_dayeon/features/board/domain/use_cases/save_board_use_case.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

import 'board_add_state.dart';

class BoardAddNotifier extends StateNotifier<BoardAddState> {
  final SaveBoardUseCase saveBoardUseCase;

  BoardAddNotifier({required this.saveBoardUseCase}) : super(BoardAddState());

  Future<void> saveBoard(BoardEntity board) async{
    saveBoardUseCase.call(board);
  }
}
