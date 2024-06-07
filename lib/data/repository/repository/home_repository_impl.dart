import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() {
    return remoteDataSource.getBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);
  }
}
