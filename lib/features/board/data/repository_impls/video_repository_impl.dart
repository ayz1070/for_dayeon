import '../../domain/entities/video_entity.dart';
import '../../domain/repositories/video_repository.dart';
import '../data_sources/video_data_source.dart';
import '../models/video_model.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoDataSource dataSource;

  VideoRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveVideo(VideoEntity videoEntity) async {
    final model = VideoModel.fromEntity(videoEntity);
    await dataSource.saveVideo(model);
  }

  @override
  Future<VideoEntity?> fetchVideoById(String videoId) async {
    final model = await dataSource.fetchVideoById(videoId);
    return model?.toEntity();
  }

  @override
  Future<List<VideoEntity>> fetchVideosByUserId(String userId) async {
    final models = await dataSource.fetchVideosByUserId(userId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<VideoEntity>> fetchVideosByCoupleId(String coupleId) async {
    final models = await dataSource.fetchVideosByCoupleId(coupleId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<VideoEntity>> fetchVideos() async {
    final models = await dataSource.fetchVideos();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateVideo(VideoEntity videoEntity) async {
    final model = VideoModel.fromEntity(videoEntity);
    await dataSource.updateVideo(model);
  }

  @override
  Future<void> deleteVideoById(String videoId) async {
    await dataSource.deleteVideoById(videoId);
  }
}