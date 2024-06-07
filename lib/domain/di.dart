//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource =>object apiManager

import 'package:flutter_e_commerce_c10_sun3/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/data_source/cart_remote_data_source_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/data_source/home_remote_data_source_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/repository/auth_repository_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/repository/cart_repository_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/repository/home_repository_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/auth_repository.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/cart_repository.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/add_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_all_Products_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/login_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/register_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/update_count_in_cart_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(homeRepository: injectHomeRepository());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(homeRepository: injectHomeRepository());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(homeRepository: injectHomeRepository());
}

AddCartUseCase injectAddCartUseCase() {
  return AddCartUseCase(homeRepository: injectHomeRepository());
}

HomeRepository injectHomeRepository() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(cartRepository: injectCartRepository());
}

DeleteItemInCartUseCase injectDeleteItemInCartUseCase() {
  return DeleteItemInCartUseCase(cartRepository: injectCartRepository());
}

UpdateCountInCartUseCase injectUpdateCountInCartUseCase() {
  return UpdateCountInCartUseCase(cartRepository: injectCartRepository());
}

CartRepository injectCartRepository() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
