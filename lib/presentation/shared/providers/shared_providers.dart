// lib/presentation/shared/providers/shared_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/presentation/shared/providers/dio_provider.dart'; // ✅ correcto
import 'package:flutter_application_1/data/datasources/auth/auth_datasource.dart';
import 'package:flutter_application_1/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:flutter_application_1/domain/usecases/auth/login_usecase.dart';
import 'package:flutter_application_1/domain/repositories/auth/auth_repository.dart';

final authDatasourceProvider = Provider<AuthDatasource>(
  (ref) => AuthDatasourceImpl(ref.watch(dioProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authDatasourceProvider)),
);

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);
