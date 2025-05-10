import 'package:for_dayeon/features/board/data/models/user_model.dart';

class TestData{
  static final loginUser = UserModel(id: "test_user_id",coupleId: "test_couple_id", name: "맹철수", imageUrl: "https://picsum.photos/200/300", metAt: DateTime.now(), createdAt: DateTime.now());
}