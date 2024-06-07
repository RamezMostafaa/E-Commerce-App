import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/cart_repository.dart';

import '../entities/failurs.dart';

class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
