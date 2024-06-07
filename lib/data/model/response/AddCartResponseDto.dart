import 'package:flutter_e_commerce_c10_sun3/domain/entities/AddCartResponseEntity.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  AddCartResponseDto({
    super.status,
    super.message,
    this.statusMsg,
    super.numOfCartItems,
    super.data,
  });

  AddCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddDataDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddDataDto extends AddDataEntity {
  AddDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDto extends AddProductEntity {
  AddProductDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
