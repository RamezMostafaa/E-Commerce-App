import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/AuthResultEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}
