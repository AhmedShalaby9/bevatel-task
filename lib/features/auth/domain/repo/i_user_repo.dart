import '../model/user_model.dart';

abstract class IAuthRepo {
  Future<void> signUp(UserModel user, String password);
  Future<void> login(String email, String password);
}
