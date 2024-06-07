import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';

import '../entities/AddCartResponseEntity.dart';
import '../entities/failurs.dart';

class AddCartUseCase {
  HomeRepository homeRepository;

  AddCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}