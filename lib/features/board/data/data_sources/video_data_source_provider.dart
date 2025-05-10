import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'video_remote_data_source.dart';
import 'video_data_source.dart';

final videoDataSourceProvider = Provider<VideoDataSource>((ref) {
  final firestore = FirebaseFirestore.instance;
  return VideoRemoteDataSource(firestore: firestore);
});