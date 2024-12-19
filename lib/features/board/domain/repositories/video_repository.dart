import '../entities/video_entity.dart';

abstract class VideoRepository {
  Future<void> saveVideo(VideoEntity videoEntity);
  Future<VideoEntity?> fetchVideoById(String videoId);
  Future<List<VideoEntity>> fetchVideosByUserId(String userId);
  Future<List<VideoEntity>> fetchVideosByCoupleId(String coupleId);
  Future<List<VideoEntity>> fetchVideos();
  Future<void> updateVideo(VideoEntity videoEntity);
  Future<void> deleteVideoById(String videoId);
}