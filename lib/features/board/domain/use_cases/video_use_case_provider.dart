import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/domain/use_cases/video_use_case.dart';
import '../../data/repository_impls/video_repository_provider.dart';


// SaveVideoUseCase Provider
final saveVideoUseCaseProvider = Provider<SaveVideoUseCase>((ref) {
  return SaveVideoUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// FetchVideoByIdUseCase Provider
final fetchVideoByIdUseCaseProvider = Provider<FetchVideoByIdUseCase>((ref) {
  return FetchVideoByIdUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// FetchVideosByUserIdUseCase Provider
final fetchVideosByUserIdUseCaseProvider = Provider<FetchVideosByUserIdUseCase>((ref) {
  return FetchVideosByUserIdUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// FetchVideosByCoupleIdUseCase Provider
final fetchVideosByCoupleIdUseCaseProvider = Provider<FetchVideosByCoupleIdUseCase>((ref) {
  return FetchVideosByCoupleIdUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// FetchVideosUseCase Provider
final fetchVideosUseCaseProvider = Provider<FetchVideosUseCase>((ref) {
  return FetchVideosUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// UpdateVideoUseCase Provider
final updateVideoUseCaseProvider = Provider<UpdateVideoUseCase>((ref) {
  return UpdateVideoUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});

// DeleteVideoByIdUseCase Provider
final deleteVideoByIdUseCaseProvider = Provider<DeleteVideoByIdUseCase>((ref) {
  return DeleteVideoByIdUseCase(
    repository: ref.watch(videoRepositoryProvider),
  );
});