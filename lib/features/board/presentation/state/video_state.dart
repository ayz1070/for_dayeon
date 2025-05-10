import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/video_view_model.dart';

class VideoState {
  final AsyncValue<List<VideoViewModel>> videos;

  VideoState({required this.videos});

  // 상태 복사 메서드
  VideoState copyWith({AsyncValue<List<VideoViewModel>>? videos}) {
    return VideoState(
      videos: videos ?? this.videos,
    );
  }

  // 초기 상태
  static VideoState initial() {
    return VideoState(
      videos: const AsyncValue.loading(),
    );
  }
}