import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class GetCartScreenLoadingState extends CartScreenStates {
  String? loadingMessage;

  GetCartScreenLoadingState({required this.loadingMessage});
}

class GetCartScreenErrorState extends CartScreenStates {
  Failures? errors;

  GetCartScreenErrorState({required this.errors});
}

class GetCartScreenSuccessState extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  GetCartScreenSuccessState({required this.cartResponseEntity});
}

class DeleteItemInCartScreenLoadingState extends CartScreenStates {
  String? loadingMessage;

  DeleteItemInCartScreenLoadingState({required this.loadingMessage});
}

class DeleteItemInCartScreenErrorState extends CartScreenStates {
  Failures? errors;

  DeleteItemInCartScreenErrorState({required this.errors});
}

class DeleteItemInCartScreenSuccessState extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  DeleteItemInCartScreenSuccessState({required this.cartResponseEntity});
}

class UpdateCountInCartScreenLoadingState extends CartScreenStates {
  String? loadingMessage;

  UpdateCountInCartScreenLoadingState({required this.loadingMessage});
}

class UpdateCountInCartScreenErrorState extends CartScreenStates {
  Failures? errors;

  UpdateCountInCartScreenErrorState({required this.errors});
}

class UpdateCountInCartScreenSuccessState extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  UpdateCountInCartScreenSuccessState({required this.cartResponseEntity});
}
