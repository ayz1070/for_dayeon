import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';
import '../../domain/use_cases/delete_board_by_id_use_case.dart';
import '../../domain/use_cases/fetch_board_by_id_use_case.dart';
import '../../domain/use_cases/fetch_boards_by_couple_id_use_case.dart';
import '../../domain/use_cases/fetch_boards_by_user_id_use_case.dart';
import '../../domain/use_cases/fetch_boards_use_case.dart';
import '../../domain/use_cases/save_board_use_case.dart';
import '../../domain/use_cases/update_board_use_case.dart';

class BoardStateNotifier extends StateNotifier<AsyncValue<List<BoardViewModel>>> {
  final FetchBoardsUseCase fetchBoardsUseCase;
  final FetchBoardByIdUseCase fetchBoardByIdUseCase;
  final FetchBoardsByUserIdUseCase fetchBoardsByUserIdUseCase;
  final FetchBoardsByCoupleIdUseCase fetchBoardsByCoupleIdUseCase;
  final SaveBoardUseCase saveBoardUseCase;
  final UpdateBoardUseCase updateBoardUseCase;
  final DeleteBoardByIdUseCase deleteBoardByIdUseCase;

  BoardStateNotifier({
    required this.fetchBoardsUseCase,
    required this.fetchBoardByIdUseCase,
    required this.fetchBoardsByUserIdUseCase,
    required this.fetchBoardsByCoupleIdUseCase,
    required this.saveBoardUseCase,
    required this.updateBoardUseCase,
    required this.deleteBoardByIdUseCase,
  }) : super(const AsyncValue.loading());

  // 모든 게시물 로드
  Future<void> loadBoards() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태
      final boards = await fetchBoardsUseCase.call(NoParams());
      state = AsyncValue.data(boards.map(BoardViewModel.fromEntity).toList()); // 성공 상태
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }

  // 특정 사용자 게시물 로드
  Future<void> loadBoardsByUserId(String userId) async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태
      final boards = await fetchBoardsByUserIdUseCase.call(userId);
      state = AsyncValue.data(boards.map(BoardViewModel.fromEntity).toList()); // 성공 상태
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }

  // 특정 커플 게시물 로드
  Future<void> loadBoardsByCoupleId(String coupleId) async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태
      final boards = await fetchBoardsByCoupleIdUseCase.call(coupleId);
      state = AsyncValue.data(boards.map(BoardViewModel.fromEntity).toList()); // 성공 상태
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }

  // 게시물 추가
  Future<void> addItem(BoardViewModel boardViewModel) async {
    try {
      final entity = BoardViewModel.toEntity(boardViewModel);
      await saveBoardUseCase.call(entity);
      final currentBoards = state.value ?? [];
      state = AsyncValue.data([...currentBoards, boardViewModel]); // 새 게시물 추가
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }

  // 게시물 수정
  Future<void> updateItem(BoardViewModel updatedBoardViewModel) async {
    try {
      final entity = BoardViewModel.toEntity(updatedBoardViewModel);
      await updateBoardUseCase.call(entity);
      final currentBoards = state.value ?? [];
      final index = currentBoards.indexWhere((board) => board.id == updatedBoardViewModel.id);
      if (index != -1) {
        final updatedBoards = [...currentBoards];
        updatedBoards[index] = updatedBoardViewModel;
        state = AsyncValue.data(updatedBoards); // 성공적으로 수정된 상태
      }
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }

  // 게시물 삭제
  Future<void> deleteItem(String id) async {
    try {
      await deleteBoardByIdUseCase.call(id);
      final currentBoards = state.value ?? [];
      state = AsyncValue.data(
        currentBoards.where((board) => board.id != id).toList(), // 삭제된 상태
      );
    } catch (error, stack) {
      state = AsyncValue.error(error, stack); // 에러 상태
    }
  }
}
