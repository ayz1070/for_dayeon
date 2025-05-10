import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../models/video_model.dart';
import 'video_data_source.dart';

class VideoRemoteDataSource implements VideoDataSource {
  final FirebaseFirestore firestore;
  final Logger logger = Logger();

  VideoRemoteDataSource({required this.firestore});

  @override
  Future<void> saveVideo(VideoModel videoModel) async {
    final videoRef = firestore.collection('videos').doc();
    final newVideoModel = videoModel.copyWith(
      id: videoRef.id,
      createdAt: DateTime.now(),
    );
    try {
      await videoRef.set(newVideoModel.toMap());
      logger.i('saveVideo 성공, videoId : ${newVideoModel.id}');
    } catch (e) {
      throw Exception('saveVideo 실패 : $e');
    }
  }

  @override
  Future<VideoModel?> fetchVideoById(String videoId) async {
    try {
      final doc = await firestore.collection('videos').doc(videoId).get();
      if (!doc.exists) return null;
      return VideoModel.fromMap(doc.data()!, id: doc.id);
    } catch (e) {
      throw Exception('Failed to fetch video by ID: $e');
    }
  }

  @override
  Future<List<VideoModel>> fetchVideosByUserId(String userId) async {
    try {
      final snapshot = await firestore
          .collection('videos')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch videos by user ID: $e');
    }
  }

  @override
  Future<List<VideoModel>> fetchVideosByCoupleId(String coupleId) async {
    try {
      final snapshot = await firestore
          .collection('videos')
          .where('coupleId', isEqualTo: coupleId)
          .get();
      return snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch videos by couple ID: $e');
    }
  }

  @override
  Future<List<VideoModel>> fetchVideos() async {
    try {
      final snapshot = await firestore.collection('videos').get();
      return snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch videos: $e');
    }
  }

  @override
  Future<void> updateVideo(VideoModel videoModel) async {
    try {
      if (videoModel.id == null) {
        throw Exception('Video ID is required for update.');
      }
      await firestore
          .collection('videos')
          .doc(videoModel.id)
          .update(videoModel.toMap());
    } catch (e) {
      throw Exception('Failed to update video: $e');
    }
  }

  @override
  Future<void> deleteVideoById(String videoId) async {
    try {
      await firestore.collection('videos').doc(videoId).delete();
    } catch (e) {
      throw Exception('Failed to delete video: $e');
    }
  }
}