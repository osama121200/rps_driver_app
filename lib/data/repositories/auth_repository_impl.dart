import '../../core/services/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final SecureStorageService storage;
  AuthRepositoryImpl({required this.remote, required this.storage});

  @override
  Future<User?> getCurrentUser() async {
    // Placeholder: would call a profile endpoint if available
    return null;
  }

  @override
  Future<String> login({required String matricule, required String password}) async {
    final token = await remote.login(matricule: matricule, password: password);
    await storage.saveToken(token.token);
    return token.token;
  }

  @override
  Future<void> logout() async {
    await storage.clearToken();
  }
}

