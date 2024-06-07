import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';

import '../entities/failurs.dart';

class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getProducts();
  }
}
