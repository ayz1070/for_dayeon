import '../models/video_model.dart';

abstract class VideoDataSource {
  /// 동영상 저장
  Future<void> saveVideo(VideoModel videoModel);

  /// 동영상 읽기
  Future<VideoModel?> fetchVideoById(String videoId);
  Future<List<VideoModel>> fetchVideosByUserId(String userId);
  Future<List<VideoModel>> fetchVideosByCoupleId(String coupleId);
  Future<List<VideoModel>> fetchVideos();

  /// 동영상 업데이트
  Future<void> updateVideo(VideoModel videoModel);

  /// 동영상 삭제
  Future<void> deleteVideoById(String videoId);
}