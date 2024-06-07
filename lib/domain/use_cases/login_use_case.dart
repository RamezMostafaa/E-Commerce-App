import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/auth_repository.dart';

import '../entities/AuthResultEntity.dart';
import '../entities/failurs.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
