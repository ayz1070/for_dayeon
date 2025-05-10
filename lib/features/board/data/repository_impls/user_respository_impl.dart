// import 'package:for_dayeon/features/board/domain/entities/user_entity.dart';
// import 'package:for_dayeon/features/board/domain/repositories/user_repository.dart';
//
// import '../models/user_model.dart';
//
// class UserRepositoryImpl implements UserRepository {
//   final UserDataSource dataSource;
//
//   UserRepositoryImpl({required this.dataSource});
//
//   @override
//   Future<UserEntity?> fetchUserById(String userId) async {
//     final model = await dataSource.fetchUserById(userId);
//     return model?.toEntity();
//   }
//
//   @override
//   Future<List<UserEntity>> fetchUsersByCoupleId(String coupleId) async {
//     final models = await dataSource.fetchUsersByCoupleId(coupleId);
//     return models.map((model) => model.toEntity()).toList();
//   }
//
//   @override
//   Future<void> saveUser(UserEntity userEntity) async {
//     final model = UserModelMapper.fromEntity(userEntity);
//     await dataSource.saveUser(model);
//   }
//
//   @override
//   Future<void> updateUser(UserEntity userEntity) async {
//     final model = UserModelMapper.fromEntity(userEntity);
//     await dataSource.updateUser(model);
//   }
// }