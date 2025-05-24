// lib/domain/usecases/auth/login_usecase.dart

import 'package:flutter_application_1/data/models/auth/login_request_model.dart';
import 'package:flutter_application_1/domain/entities/auth/login_response.dart';
import 'package:flutter_application_1/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(LoginRequestModel request) {
    return repository.login(request);
  }
}
