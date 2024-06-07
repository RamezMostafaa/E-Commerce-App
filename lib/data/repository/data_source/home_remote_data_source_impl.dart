import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getCategories() async {
    var either = await apiManager.getCategories();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() async {
    var either = await apiManager.getBrands();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }
}
