import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/auth_repository.dart';

import '../entities/AuthResultEntity.dart';
import '../entities/failurs.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
