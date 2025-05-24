// lib/data/models/auth/login_response_model.dart

import 'package:konecta_go/domain/entities/auth/login_response.dart';

class LoginResponseModel {
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token']);
  }

  LoginResponse toEntity() {
    return LoginResponse(token: token);
  }
}
