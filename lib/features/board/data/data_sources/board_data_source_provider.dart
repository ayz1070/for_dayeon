import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_dayeon/core/providers/firebase_provider.dart';
import 'package:for_dayeon/features/board/data/data_sources/board_data_source.dart';

import 'board_remote_data_source.dart';

final boardDataSourceProvider = Provider<BoardDataSource>((ref){
  final firestore = ref.watch(firestoreProvider);
  return BoardRemoteDataSource(firestore: firestore);
});