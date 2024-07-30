import 'package:b_commerce/features/login_screen/data/repository/auth_repo_implmn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/api_manager/api_manager.dart';
import '../../data/datasource/auth_datasource.dart';

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
     final AuthRepoImplmn authRepoImplmn =  AuthRepoImplmn(
         authDataSource: AuthDatasource()
     );
      final response = await authRepoImplmn.login(
          username,
          password
      );
      response.fold(
         (l) => emit(LoginFailure(l.message)),
          (r) {
            currentUserToken = r.token;
            currentUserId = r.id;
            if (keepMeLogin) {
              const FlutterSecureStorage().write(key: 'token', value: r.token);
              const FlutterSecureStorage().write(key: 'id', value: r.id.toString() );
            }
            emit(LoginSuccess("Welcome back ${r.name}"));
          }
      );

     }

  }

}
