import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/api_manager/api_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController(text: "carterb");
  final TextEditingController passwordController = TextEditingController(text: "carterbpass");
  final formKey = GlobalKey<FormState>();
  static String? currentUserToken;
  static int? currentUserId;
  void login({
    required bool keepMeLogin,
    required String username,
    required String password,
}) async{
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      emit(LoginLoading());
      try {

        var request = await ApiManager.login(username: username, password: password);
        currentUserToken = request.token;
        currentUserId = request.id;
        if (keepMeLogin) {
          await const FlutterSecureStorage().write(key: 'token', value: request.token?? '');
          await const FlutterSecureStorage().write(key: 'id', value: request.id.toString() );
        }

          emit(LoginSuccess("Welcome back ${request.username}"));



      }on
      DioException catch (e) {
        if(e.message == "Invalid credentials" || e.response?.data['message'] == "Invalid credentials"){
          emit(LoginFailure("Wrong username or password"));
        }else{
          emit(LoginFailure(e.response?.data['message'] ?? e.message));

        }
      }
      catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }

  }

}
