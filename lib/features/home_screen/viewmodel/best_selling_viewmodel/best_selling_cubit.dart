import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/product_item.dart';

part 'best_selling_state.dart';

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit() : super(BestSellingInitial());
  static BestSellingCubit get(context) => BlocProvider.of(context);
  List<ProductItemModel> bestSelling = [
    ProductItemModel(
        title: 'Long Sleeve Dress',
        description: "This is a long sleeve dress with a round neck and a belt to tie around the waist",
        price: '1200 LE',
        image: 'assets/images/bestSale.png',
        id: '1'
    ),
    ProductItemModel(
        title: 'Turtleneck Sweater',
        description: "This is a turtleneck sweater with a round neck and a belt to tie around the waist",
        price: '1500 LE',
        image: 'assets/images/women3.png',
        id: '2'
    ),
    ProductItemModel(
        title: 'Sport Wear Set',
        description: "This is a sport wear set with a round neck and a belt to tie around the waist",
        price: '700 LE',
        image: 'assets/images/women2.png',
        id: '3'
    )
  ];

  void getBestSelling() {
    emit(BestSellingLoading());
    try {
      emit(BestSellingLoaded(bestSelling));
    } catch (e) {
      emit(BestSellingError(e.toString()));
    }
  }

}
