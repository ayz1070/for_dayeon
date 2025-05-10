import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/video_use_case.dart';
import '../view_models/video_view_model.dart';


class VideoStateNotifier extends StateNotifier<AsyncValue<List<VideoViewModel>>> {
  final FetchVideosUseCase fetchVideosUseCase;
  final FetchVideosByUserIdUseCase fetchVideosByUserIdUseCase;
  final FetchVideosByCoupleIdUseCase fetchVideosByCoupleIdUseCase;
  final SaveVideoUseCase saveVideoUseCase;
  final UpdateVideoUseCase updateVideoUseCase;
  final DeleteVideoByIdUseCase deleteVideoByIdUseCase;

  VideoStateNotifier({
    required this.fetchVideosUseCase,
    required this.fetchVideosByUserIdUseCase,
    required this.fetchVideosByCoupleIdUseCase,
    required this.saveVideoUseCase,
    required this.updateVideoUseCase,
    required this.deleteVideoByIdUseCase,
  }) : super(const AsyncValue.loading());

  // 모든 동영상 로드
  Future<void> loadVideos() async {
    try {
      state = const AsyncValue.loading();
      final videos = await fetchVideosUseCase.call(null);
      state = AsyncValue.data(videos.map(VideoViewModel.fromEntity).toList());
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // 특정 사용자 동영상 로드
  Future<void> loadVideosByUserId(String userId) async {
    try {
      state = const AsyncValue.loading();
      final videos = await fetchVideosByUserIdUseCase.call(userId);
      state = AsyncValue.data(videos.map(VideoViewModel.fromEntity).toList());
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // 특정 커플 동영상 로드
  Future<void> loadVideosByCoupleId(String coupleId) async {
    try {
      state = const AsyncValue.loading();
      final videos = await fetchVideosByCoupleIdUseCase.call(coupleId);
      state = AsyncValue.data(videos.map(VideoViewModel.fromEntity).toList());
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // 동영상 추가
  Future<void> addVideo(VideoViewModel videoViewModel) async {
    try {
      final entity = VideoViewModel.toEntity(videoViewModel);
      await saveVideoUseCase.call(entity);
      final currentVideos = state.value ?? [];
      state = AsyncValue.data([...currentVideos, videoViewModel]);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // 동영상 수정
  Future<void> updateVideo(VideoViewModel updatedVideoViewModel) async {
    try {
      final entity = VideoViewModel.toEntity(updatedVideoViewModel);
      await updateVideoUseCase.call(entity);
      final currentVideos = state.value ?? [];
      final index = currentVideos.indexWhere((video) => video.id == updatedVideoViewModel.id);
      if (index != -1) {
        final updatedVideos = [...currentVideos];
        updatedVideos[index] = updatedVideoViewModel;
        state = AsyncValue.data(updatedVideos);
      }
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  // 동영상 삭제
  Future<void> deleteVideo(String id) async {
    try {
      await deleteVideoByIdUseCase.call(id);
      final currentVideos = state.value ?? [];
      state = AsyncValue.data(
        currentVideos.where((video) => video.id != id).toList(),
      );
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}