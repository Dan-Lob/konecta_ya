// lib/presentation/features/auth/controllers/login_controller.dart

import 'package:konecta_go/presentation/shared/providers/secure_storage_provider.dart';
import 'package:konecta_go/presentation/shared/providers/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konecta_go/data/models/auth/login_request_model.dart';
import 'package:konecta_go/domain/usecases/auth/login_usecase.dart';
import 'package:konecta_go/presentation/features/auth/controllers/login_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) {
    final useCase = ref.watch(loginUseCaseProvider);
    final storage = ref.watch(secureStorageProvider);
    return LoginController(useCase, storage);
  },
);

class LoginController extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;
  final FlutterSecureStorage _storage;

  LoginController(this._loginUseCase, this._storage)
      : super(const LoginState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: LoginStatus.loading);

    final request = LoginRequestModel(email: email, password: password);

    try {
      final response = await _loginUseCase.call(request);

      await _storage.write(key: 'token', value: response.token);

      state = state.copyWith(
        status: LoginStatus.success,
        user: response,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoginStatus.error,
        error: e.toString(),
      );
    }
  }

  void reset() {
    state = const LoginState();
  }
}
