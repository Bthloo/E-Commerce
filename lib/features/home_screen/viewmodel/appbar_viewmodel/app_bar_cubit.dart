import 'package:b_commerce/features/cart_screen/view/pages/cart_tab.dart';
import 'package:b_commerce/features/home_screen/view/pages/home_tab.dart';
import 'package:b_commerce/features/home_screen/view/pages/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile_screen/view/pages/profile_tab.dart';
part 'app_bar_state.dart';
class BottomAppBarCubit extends Cubit<BottomAppBarState> {
  BottomAppBarCubit() : super(BottomAppBarInitial());
  static BottomAppBarCubit get(context) => BlocProvider.of(context);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int currentTapIndex = 0;
  List<String> titles = [
    "Bthloo Store",
    "Discover",
    "Cart",
    "Profile"
  ];
  List<Widget> tabs = [
    const HomeTab(),
      const SearchTab(),
    const CartTab(),
    const ProfileTab()
  ];
  void changeIndex(int index) {
    currentTapIndex = index;
    emit(ChangeBottomAppbarState());
  }
}
