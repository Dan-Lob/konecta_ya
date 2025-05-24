// domain/repositories/auth/auth_repository.dart
import 'package:konecta_go/data/models/auth/login_request_model.dart';
import 'package:konecta_go/domain/entities/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequestModel request);
}
