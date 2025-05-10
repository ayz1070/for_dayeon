import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/board_use_case_provider.dart';
import '../view_models/board_view_model.dart';
import 'board_add_notifier.dart';
import 'board_add_state.dart';
import 'board_state_notifier.dart';

final boardStateNotifierProvider =
StateNotifierProvider<BoardStateNotifier, AsyncValue<List<BoardViewModel>>>((ref) {
  final fetchBoardsUseCase = ref.read(fetchBoardsUseCaseProvider);
  final fetchBoardByIdUseCase = ref.read(fetchBoardByIdUseCaseProvider);
  final fetchBoardsByUserIdUseCase = ref.read(fetchBoardsByUserIdUseCaseProvider);
  final fetchBoardsByCoupleIdUseCase = ref.read(fetchBoardsByCoupleIdUseCaseProvider);
  final saveBoardUseCase = ref.read(saveBoardUseCaseProvider);
  final updateBoardUseCase = ref.read(updateBoardUseCaseProvider);
  final deleteBoardByIdUseCase = ref.read(deleteBoardByIdUseCaseProvider);

  return BoardStateNotifier(
    fetchBoardsUseCase: fetchBoardsUseCase,
    fetchBoardByIdUseCase: fetchBoardByIdUseCase,
    fetchBoardsByUserIdUseCase: fetchBoardsByUserIdUseCase,
    fetchBoardsByCoupleIdUseCase: fetchBoardsByCoupleIdUseCase,
    saveBoardUseCase: saveBoardUseCase,
    updateBoardUseCase: updateBoardUseCase,
    deleteBoardByIdUseCase: deleteBoardByIdUseCase,
  );
});


//추가
final boardAddProvider = StateNotifierProvider<BoardAddNotifier, BoardAddState>(
      (ref) => BoardAddNotifier(),
);