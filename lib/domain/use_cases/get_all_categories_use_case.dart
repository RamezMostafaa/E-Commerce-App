import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failurs.dart';

class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getCategories();
  }
}
