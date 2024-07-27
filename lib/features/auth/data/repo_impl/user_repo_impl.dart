import 'package:bevatel_task/features/auth/data/mapper/auth_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/model/user_model.dart';
import '../../domain/repo/i_user_repo.dart';

class AuthRepo extends IAuthRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final AuthMapper userMapper;

  AuthRepo(this.auth, this.firestore) : userMapper = AuthMapper();

  @override
  Future<void> signUp(UserModel user, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      final newUser = user.copyWith(id: userCredential.user?.uid ?? '');
      final entity = userMapper.transformUserModelToEntity(newUser);
      await firestore.collection('users').doc(newUser.id).set(entity.toJson());
    } catch (e) {
      throw Exception('Error signing up user: $e');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Error logging in user: $e');
    }
  }
}
