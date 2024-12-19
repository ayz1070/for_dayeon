import '../entities/video_entity.dart';
import '../repositories/video_repository.dart';

abstract class VideoUseCase<Type, Params> {
  Future<Type> call(Params params);
}


class SaveVideoUseCase implements VideoUseCase<void, VideoEntity> {
  final VideoRepository repository;

  SaveVideoUseCase({required this.repository});

  @override
  Future<void> call(VideoEntity videoEntity) async {
    await repository.saveVideo(videoEntity);
  }
}

class FetchVideoByIdUseCase implements VideoUseCase<VideoEntity?, String> {
  final VideoRepository repository;

  FetchVideoByIdUseCase({required this.repository});

  @override
  Future<VideoEntity?> call(String videoId) async {
    return await repository.fetchVideoById(videoId);
  }
}

class FetchVideosByUserIdUseCase implements VideoUseCase<List<VideoEntity>, String> {
  final VideoRepository repository;

  FetchVideosByUserIdUseCase({required this.repository});

  @override
  Future<List<VideoEntity>> call(String userId) async {
    return await repository.fetchVideosByUserId(userId);
  }
}


class FetchVideosByCoupleIdUseCase implements VideoUseCase<List<VideoEntity>, String> {
  final VideoRepository repository;

  FetchVideosByCoupleIdUseCase({required this.repository});

  @override
  Future<List<VideoEntity>> call(String coupleId) async {
    return await repository.fetchVideosByCoupleId(coupleId);
  }
}

class FetchVideosUseCase implements VideoUseCase<List<VideoEntity>, void> {
  final VideoRepository repository;

  FetchVideosUseCase({required this.repository});

  @override
  Future<List<VideoEntity>> call(void _) async {
    return await repository.fetchVideos();
  }
}

class UpdateVideoUseCase implements VideoUseCase<void, VideoEntity> {
  final VideoRepository repository;

  UpdateVideoUseCase({required this.repository});

  @override
  Future<void> call(VideoEntity videoEntity) async {
    await repository.updateVideo(videoEntity);
  }
}


class DeleteVideoByIdUseCase implements VideoUseCase<void, String> {
  final VideoRepository repository;

  DeleteVideoByIdUseCase({required this.repository});

  @override
  Future<void> call(String videoId) async {
    await repository.deleteVideoById(videoId);
  }
}