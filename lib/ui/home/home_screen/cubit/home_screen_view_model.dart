import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/cubit/states.dart';

import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  //todo: hold data - handle logic
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  void changeSelectedIndex(int newSelectedIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
