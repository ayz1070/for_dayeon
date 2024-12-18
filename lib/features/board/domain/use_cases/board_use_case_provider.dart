import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/domain/use_cases/save_board_use_case.dart';
import 'package:for_dayeon/features/board/domain/use_cases/update_board_use_case.dart';

import '../../data/repository_impls/board_repository_provider.dart';
import 'delete_board_by_id_use_case.dart';
import 'fetch_board_by_id_use_case.dart';
import 'fetch_boards_by_couple_id_use_case.dart';
import 'fetch_boards_by_user_id_use_case.dart';
import 'fetch_boards_use_case.dart';


// SaveBoardUseCase Provider
final saveBoardUseCaseProvider = Provider<SaveBoardUseCase>((ref) {
  return SaveBoardUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// FetchBoardByIdUseCase Provider
final fetchBoardByIdUseCaseProvider = Provider<FetchBoardByIdUseCase>((ref) {
  return FetchBoardByIdUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// FetchBoardsByUserIdUseCase Provider
final fetchBoardsByUserIdUseCaseProvider =
Provider<FetchBoardsByUserIdUseCase>((ref) {
  return FetchBoardsByUserIdUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// FetchBoardsByCoupleIdUseCase Provider
final fetchBoardsByCoupleIdUseCaseProvider =
Provider<FetchBoardsByCoupleIdUseCase>((ref) {
  return FetchBoardsByCoupleIdUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// FetchBoardsUseCase Provider
final fetchBoardsUseCaseProvider = Provider<FetchBoardsUseCase>((ref) {
  return FetchBoardsUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// UpdateBoardUseCase Provider
final updateBoardUseCaseProvider = Provider<UpdateBoardUseCase>((ref) {
  return UpdateBoardUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});

// DeleteBoardByIdUseCase Provider
final deleteBoardByIdUseCaseProvider = Provider<DeleteBoardByIdUseCase>((ref) {
  return DeleteBoardByIdUseCase(
    repository: ref.watch(boardRepositoryProvider),
  );
});