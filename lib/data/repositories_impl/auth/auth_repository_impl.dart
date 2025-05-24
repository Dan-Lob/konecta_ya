import 'package:flutter_application_1/data/datasources/auth/auth_datasource.dart';
import 'package:flutter_application_1/data/models/auth/login_request_model.dart';
import 'package:flutter_application_1/domain/entities/auth/login_response.dart';
import 'package:flutter_application_1/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<LoginResponse> login(LoginRequestModel request) {
    return datasource.login(request);
  }
}
