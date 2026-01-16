import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;
  const Login(this.repository);

  Future<String> call({required String matricule, required String password}) {
    return repository.login(matricule: matricule, password: password);
  }
}

