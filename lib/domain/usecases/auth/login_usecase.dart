// lib/domain/usecases/auth/login_usecase.dart

import 'package:konecta_go/data/models/auth/login_request_model.dart';
import 'package:konecta_go/domain/entities/auth/login_response.dart';
import 'package:konecta_go/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(LoginRequestModel request) {
    return repository.login(request);
  }
}
