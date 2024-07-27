import '../../../domain/model/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedUp extends AuthState {}

class AuthLoggedIn extends AuthState {}

class UsersLoaded extends AuthState {
  final List<UserModel> users;
  UsersLoaded(this.users);
  List<Object> get props => [users];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
