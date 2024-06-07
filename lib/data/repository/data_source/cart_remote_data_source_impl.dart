import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await apiManager.updateCountInCart(productId, count);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
