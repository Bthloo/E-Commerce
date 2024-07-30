import 'package:b_commerce/core/general_components/build_show_toast.dart';
import 'package:b_commerce/core/general_components/custom_form_field.dart';
import 'package:b_commerce/core/general_components/dialog.dart';
import 'package:b_commerce/features/home_screen/view/pages/home_screen.dart';
import 'package:b_commerce/features/login_screen/presentation/cubit/login_cubit.dart';
import 'package:b_commerce/features/register_screen/view/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/general_components/color_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool keepMeLogged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         TextButton(
             onPressed: () {
                Navigator.pushReplacementNamed(
                    context,
                    HomeScreen.routeName
                );
             },
             child: Text('Cancel',
               style: Theme.of(context).textTheme.titleMedium!.copyWith(
               fontSize: 14,
               fontWeight: FontWeight.w600
               //  fontWeight: FontWeight.bold
             )
             ),
         )
        ],
      ),
      body:  Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:MediaQuery.of(context).size.width > 700 ||
                MediaQuery.of(context).size.width >MediaQuery.of(context).size.height  ?
            MediaQuery.of(context).size.width*.5 : MediaQuery.of(context).size.width
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
            child: SingleChildScrollView(
              child: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
          buildShowToast(state.message);
          Navigator.pushReplacementNamed(
              context,
              HomeScreen.routeName
          );
              }else if (state is LoginFailure) {
          DialogUtilities.showMessage(
              context,
            state.error,
            nigaiveActionName: "OK"
          );
              }
            },
            builder: (context, state) {
              return Form(
          key: context.read<LoginCubit>().formKey,
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log into\nyour account',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 2
                    ),
                    ),
                    SizedBox(height: 40.h),
                    CustomFormField(
                        hintText: 'User Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        controller: context.read<LoginCubit>().emailController,
                    ),
                    SizedBox(height: 20.h),
                    CustomFormField(
                      hintText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      controller: context.read<LoginCubit>().passwordController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: ColorHelper.mainColor,
                          side:  BorderSide(
                            color:   Theme.of(context).colorScheme.onPrimary
                          ),
                          overlayColor: WidgetStatePropertyAll(
                              Colors.white.withOpacity(.1)),
                          checkColor: Theme.of(context).primaryColor,
                          value: keepMeLogged,
                          onChanged: (value) {
                            setState(() {
                              keepMeLogged = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'keep Me Logged In',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(

                        onPressed: () {

                        },
                        child: Text("Forgot password?",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 12,
                        ),
                      ),
                    ),
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: state is LoginLoading
                          ? const CircularProgressIndicator()
                          :
                      ElevatedButton(
                          onPressed: () {
                            context.read<LoginCubit>().login(
                              keepMeLogin: keepMeLogged,
                              password:   context.read<LoginCubit>().passwordController.text,
                              username: context.read<LoginCubit>().emailController.text,

                            );
                          },
                          child: SizedBox(
                            height: 51.h,
                            width: 147.w,
                            child: const Center(
                              child: Text('LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                 // color: const Color(0xffFFFFFF)
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context,
                                  RegisterScreen.routeName
                              );
                            },
                            child: Text('Sign Up',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColorDark
                              ),
                            ),
                        ),
                      ],
                    ),

                  ],
                ),
              );
            },
          ),
          ),
            ),
          ),
        ),
      ),
    );
  }
}
