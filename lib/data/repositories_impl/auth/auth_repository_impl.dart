import 'package:konecta_go/data/datasources/auth/auth_datasource.dart';
import 'package:konecta_go/data/models/auth/login_request_model.dart';
import 'package:konecta_go/domain/entities/auth/login_response.dart';
import 'package:konecta_go/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<LoginResponse> login(LoginRequestModel request) {
    return datasource.login(request);
  }
}
