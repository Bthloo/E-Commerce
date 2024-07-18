import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/api_manager/api_manager.dart';
import '../../../../core/models/products_from_category_model.dart';

part 'get_products_from_category_state.dart';

class GetProductsFromCategoryCubit extends Cubit<GetProductsFromCategoryState> {
  GetProductsFromCategoryCubit() : super(GetProductsFromCategoryInitial());

  static GetProductsFromCategoryCubit get(context) => BlocProvider.of(context);

  getProductsFromCategory({required String categoryId,List<Products>? products}) async {
    emit(GetProductsFromCategoryLoading());
   try {
     if(categoryId == "-99"){
       emit(GetProductsFromCategorySuccess(products??[]));
       return;
     }else{
       var response = await ApiManager.getProductsFromCategory(categoryId);
       emit(GetProductsFromCategorySuccess(response.products??[]));
     }

    } catch (ex) {
     emit(GetProductsFromCategoryError('$ex'));
    }
  }
}