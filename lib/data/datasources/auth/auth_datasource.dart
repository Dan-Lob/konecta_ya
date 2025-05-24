// lib/data/datasources/auth/auth_datasource.dart

import 'package:dio/dio.dart';
import 'package:konecta_go/data/models/auth/login_request_model.dart';
import 'package:konecta_go/data/models/auth/login_response_model.dart';
import 'package:konecta_go/domain/entities/auth/login_response.dart';

abstract class AuthDatasource {
  Future<LoginResponse> login(LoginRequestModel request);
}

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;

  AuthDatasourceImpl(this.dio);

  @override
  Future<LoginResponse> login(LoginRequestModel request) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: request.toJson(),
      );
      final model = LoginResponseModel.fromJson(response.data);
      return model.toEntity();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Error al iniciar sesión');
    }
  }
}
