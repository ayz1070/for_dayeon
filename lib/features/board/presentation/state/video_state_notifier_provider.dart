import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/video_use_case_provider.dart';
import '../view_models/video_view_model.dart';
import 'video_state_notifier.dart';

final videoStateNotifierProvider =
StateNotifierProvider<VideoStateNotifier, AsyncValue<List<VideoViewModel>>>((ref) {
  final fetchVideosUseCase = ref.read(fetchVideosUseCaseProvider);
  final fetchVideosByUserIdUseCase = ref.read(fetchVideosByUserIdUseCaseProvider);
  final fetchVideosByCoupleIdUseCase = ref.read(fetchVideosByCoupleIdUseCaseProvider);
  final saveVideoUseCase = ref.read(saveVideoUseCaseProvider);
  final updateVideoUseCase = ref.read(updateVideoUseCaseProvider);
  final deleteVideoByIdUseCase = ref.read(deleteVideoByIdUseCaseProvider);

  return VideoStateNotifier(
    fetchVideosUseCase: fetchVideosUseCase,
    fetchVideosByUserIdUseCase: fetchVideosByUserIdUseCase,
    fetchVideosByCoupleIdUseCase: fetchVideosByCoupleIdUseCase,
    saveVideoUseCase: saveVideoUseCase,
    updateVideoUseCase: updateVideoUseCase,
    deleteVideoByIdUseCase: deleteVideoByIdUseCase,
  );
});