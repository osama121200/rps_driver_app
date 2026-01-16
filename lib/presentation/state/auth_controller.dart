import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/secure_storage_service.dart';
import '../../domain/usecases/login.dart';
import 'providers.dart';

class AuthState {
  final bool loading;
  final String? error;
  const AuthState({this.loading = false, this.error});

  AuthState copyWith({bool? loading, String? error}) => AuthState(
        loading: loading ?? this.loading,
        error: error,
      );
}

class AuthController extends StateNotifier<AuthState> {
  final Login loginUseCase;
  final SecureStorageService storage;
  AuthController({required this.loginUseCase, required this.storage}) : super(const AuthState());

  Future<bool> login({required String matricule, required String password}) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final token = await loginUseCase(matricule: matricule, password: password);
      await storage.saveToken(token);
      state = state.copyWith(loading: false);
      return true;
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }
}


final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(loginUseCase: ref.read(loginUseCaseProvider), storage: SecureStorageService.instance);
});

