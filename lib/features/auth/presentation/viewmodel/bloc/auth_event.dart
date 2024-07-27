import '../../../domain/model/user_model.dart';

abstract class AuthEvent {}

class SignUpUser extends AuthEvent {
  final UserModel user;
  final String password;

  SignUpUser(this.user, this.password);
}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser(this.email, this.password);
}
