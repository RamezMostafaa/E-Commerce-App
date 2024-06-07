import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
