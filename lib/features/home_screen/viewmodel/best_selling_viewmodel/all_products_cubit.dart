import 'package:b_commerce/core/api_manager/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/ProductsFromCategoryModel.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
AllProductsCubit() : super(AllProductsInitial());
  static AllProductsCubit get(context) => BlocProvider.of(context);

  void getAllProducts() async{
    emit(AllProductsLoading());
    try {
      var response = await ApiManager.getAllProducts();
      emit(AllProductsLoaded(response.products??[]));
    } catch (e) {
      emit(AllProductsError("Please Check Your Internet"));
    }
  }

}
