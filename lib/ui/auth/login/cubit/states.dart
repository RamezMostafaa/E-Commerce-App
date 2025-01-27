import 'package:flutter_e_commerce_c10_sun3/domain/entities/AuthResultEntity.dart';

abstract class LoginStates {}

/// parent class

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  AuthResultEntity authResultEntity;

  LoginSuccessState({required this.authResultEntity});
}
