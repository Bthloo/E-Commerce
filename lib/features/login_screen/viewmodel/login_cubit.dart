import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void login() async{
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      emit(LoginLoading());
      try {
         await Future.delayed(const Duration(seconds: 2),() {
           if(emailController.text == "admin"){
              emit(LoginSuccess());
           }else{
             emit(LoginFailure("Invalid Email"));
           }

         },);
       // emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }

  }

}
