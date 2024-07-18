import 'package:b_commerce/core/api_manager/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/cart_model.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit() : super(GetCartInitial());
  void getCart() async {
    emit(GetCartLoading());
    try {
      var response = await ApiManager.getCart();

      emit(GetCartSuccess(response.carts??[]));
    } on DioException catch (e) {
      emit(GetCartError(e.response?.data['message'] ?? e.message));
    }
    catch (e) {
      emit(GetCartError(e.toString()));
    }
  }
}
