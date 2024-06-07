import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/add_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_all_Products_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/product_list_tab/cubit/product_list_states.dart';

class ProductListTabViewModel extends Cubit<ProductListStates> {
  GetAllProductsUseCase productsUseCase;

  AddCartUseCase addCartUseCase;

  ProductListTabViewModel(
      {required this.productsUseCase, required this.addCartUseCase})
      : super(ProductListInitialState());

  //todo: hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductListTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductListLoadingState(loadingMessage: 'Loading...'));
    var either = await productsUseCase.invoke();
    either.fold((l) => emit(ProductListErrorState(errors: l)), (response) {
      productsList = response.data ?? [];
      emit(ProductListSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartErrorState(errors: l)), (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('NumOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(addCartResponseEntity: response));
    });
  }
}
