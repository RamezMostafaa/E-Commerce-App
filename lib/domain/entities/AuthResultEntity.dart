import 'package:flutter_e_commerce_c10_sun3/domain/entities/UserEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
