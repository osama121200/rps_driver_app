import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/network/api_client.dart';
import '../../models/auth_token_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> login({required String matricule, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? ApiClient().dio;

  @override
  Future<AuthTokenModel> login({required String matricule, required String password}) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'matricule': matricule, 'password': password},
    );
    return AuthTokenModel.fromJson(response.data as Map<String, dynamic>);
  }
}

