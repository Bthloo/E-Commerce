import 'package:b_commerce/core/api_manager/api_manager.dart';
import 'package:b_commerce/core/models/ProfileResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  void getUserProfile({required int id})async{
    emit(ProfileLoading());
    try {
    var response = await ApiManager.getUserProfile(id: id);
    emit(ProfileSuccess(response));
  }on DioException catch (e) {
    emit(ProfileError(e.response?.data['message'] ?? e.message));
  }
  catch (e) {
    emit(ProfileError(e.toString()));
  }
  }
}
