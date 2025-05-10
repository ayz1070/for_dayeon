import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUser(UserEntity userEntity);
  Future<UserEntity?> fetchUserById(String userId);
  Future<List<UserEntity>> fetchUsersByCoupleId(String coupleId);
  Future<void> updateUser(UserEntity userEntity);
}