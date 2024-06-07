import 'package:flutter_e_commerce_c10_sun3/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';

abstract class ProductListStates {}

class ProductListInitialState extends ProductListStates {}

class ProductListLoadingState extends ProductListStates {
  String? loadingMessage;

  ProductListLoadingState({required this.loadingMessage});
}

class ProductListErrorState extends ProductListStates {
  Failures? errors;

  ProductListErrorState({required this.errors});
}

class ProductListSuccessState extends ProductListStates {
  ProductResponseEntity productResponseEntity;

  ProductListSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductListStates {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductListStates {
  Failures? errors;

  AddToCartErrorState({required this.errors});
}

class AddToCartSuccessState extends ProductListStates {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}
