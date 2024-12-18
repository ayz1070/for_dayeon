import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/features/board/data/data_sources/board_data_source_provider.dart';
import 'package:for_dayeon/features/board/data/repository_impls/board_repository_impl.dart';
import 'package:for_dayeon/features/board/domain/repositories/board_repository.dart';

final boardRepositoryProvider = Provider<BoardRepository>((ref){
  final dataSource = ref.watch(boardDataSourceProvider);
  return BoardRepositoryImpl(dataSource: dataSource);
});