// domain/repositories/auth/auth_repository.dart
import 'package:flutter_application_1/data/models/auth/login_request_model.dart';
import 'package:flutter_application_1/domain/entities/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequestModel request);
}
