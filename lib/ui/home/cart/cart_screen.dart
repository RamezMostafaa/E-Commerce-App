import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/di.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/cart/cubit/cart_screen_states.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_colors.dart';
import 'widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart-screen';
  CartScreenViewModel viewModel = CartScreenViewModel(
      getCartUseCase: injectGetCartUseCase(),
      deleteItemInCartUseCase: injectDeleteItemInCartUseCase(),
      updateCountInCartUseCase: injectUpdateCountInCartUseCase());

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocProvider<CartScreenViewModel>(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Button logic here
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,
                      color: Theme.of(context).primaryColor),
                ),
                title: Text(
                  appLocalizations!.carts,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Button logic here
                    },
                    icon: Icon(Icons.search,
                        color: Theme.of(context).primaryColor),
                  ),
                  IconButton(
                    onPressed: () {
                      // Button logic here
                    },
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              body: state is GetCartScreenSuccessState
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CartItem(
                                cartEntity: state
                                    .cartResponseEntity.data!.products![index],
                              );
                            },
                            itemCount:
                                state.cartResponseEntity.data!.products!.length,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 98.h, left: 16.w, right: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: Text(appLocalizations.total_price,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: AppColors.greyColor)),
                                  ),
                                  Text(
                                      'EGP ${state.cartResponseEntity.data!.totalCartPrice}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor)),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  //logic here
                                },
                                child: Container(
                                  height: 48.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 12.h, bottom: 12.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 83.w),
                                          child: Text(
                                              appLocalizations.check_out,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 27.w, right: 32.w),
                                          child: Icon(Icons.arrow_forward,
                                              size: 20.w,
                                              color: AppColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ));
        },
      ),
    );
  }
}
