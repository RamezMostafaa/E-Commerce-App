import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/cubit/states.dart';

import 'widget/custom_bottom_navigation_bar.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.changeSelectedIndex(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
