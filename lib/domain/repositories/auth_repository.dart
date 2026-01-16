import '../entities/user.dart';

abstract class AuthRepository {
  Future<String> login({required String matricule, required String password});
  Future<User?> getCurrentUser();
  Future<void> logout();
}

