import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/cart_repository.dart';

import '../../../domain/repository/data_source/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) {
    return cartRemoteDataSource.deleteItemInCart(productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) {
    return cartRemoteDataSource.updateCountInCart(productId, count);
  }
}
