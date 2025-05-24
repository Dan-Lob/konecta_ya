// lib/presentation/shared/providers/shared_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konecta_go/presentation/shared/providers/dio_provider.dart'; // ✅ correcto
import 'package:konecta_go/data/datasources/auth/auth_datasource.dart';
import 'package:konecta_go/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:konecta_go/domain/usecases/auth/login_usecase.dart';
import 'package:konecta_go/domain/repositories/auth/auth_repository.dart';

final authDatasourceProvider = Provider<AuthDatasource>(
  (ref) => AuthDatasourceImpl(ref.watch(dioProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authDatasourceProvider)),
);

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);
