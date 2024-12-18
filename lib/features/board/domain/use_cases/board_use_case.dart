abstract class BoardUseCase<Type, Params> {
  Future<Type> call(Params params);
}