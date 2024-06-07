import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/cart/cubit/cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartScreenInitialState());

  List<GetProductCartEntity> cartItemsList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  getCart() async {
    emit(GetCartScreenLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(GetCartScreenErrorState(errors: l)), (response) {
      cartItemsList = response.data!.products ?? [];
      emit(GetCartScreenSuccessState(cartResponseEntity: response));
    });
  }

  deleteItemInCart(String productId) async {
    emit(DeleteItemInCartScreenLoadingState(loadingMessage: 'Loading...'));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartScreenErrorState(errors: l)),
        (response) {
      // cartItemsList = response.data!.products ?? [] ;
      emit(GetCartScreenSuccessState(cartResponseEntity: response));
    });
  }

  updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartScreenLoadingState(loadingMessage: 'Loading...'));
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) => emit(UpdateCountInCartScreenErrorState(errors: l)),
        (response) {
      // cartItemsList = response.data!.products ?? [] ;
      emit(GetCartScreenSuccessState(cartResponseEntity: response));
    });
  }
}
