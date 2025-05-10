import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/data/repository_impls/video_repository_impl.dart';


import '../../domain/repositories/video_repository.dart';
import '../data_sources/video_data_source_provider.dart';

final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  final dataSource = ref.watch(videoDataSourceProvider);
  return VideoRepositoryImpl(dataSource: dataSource);
});