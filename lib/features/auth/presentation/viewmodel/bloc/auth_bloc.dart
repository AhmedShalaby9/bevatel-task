import 'package:bloc/bloc.dart';
import '../../../../../common/helper/storage/shared_preferences.dart';
import '../../../domain/repo/i_user_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<SignUpUser>(_onSignUpUser);
    on<LoginUser>(_onLoginUser);
  }

  Future<void> _onSignUpUser(SignUpUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepo.signUp(event.user, event.password);
      await _saveLoginState(true);
      emit(AuthSignedUp());
      emit(AuthLoggedIn());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepo.login(event.email, event.password);
      await _saveLoginState(true);
      emit(AuthLoggedIn());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    final SharedPreferencesHelper prefs = SharedPreferencesHelper();
      prefs.saveBoolean('isLoggedIn', isLoggedIn);
  }
}
