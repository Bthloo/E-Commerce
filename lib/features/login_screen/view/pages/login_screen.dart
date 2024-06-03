import 'package:b_commerce/core/general_components/custom_form_field.dart';
import 'package:b_commerce/features/home_screen/view/pages/home_screen.dart';
import 'package:b_commerce/features/register_screen/view/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
static const String routeName = 'login_screen';
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
             child: Text('Skip',
               style: Theme.of(context).textTheme.titleMedium!.copyWith(
               fontSize: 14,
               fontWeight: FontWeight.w600
               //  fontWeight: FontWeight.bold
             )
             ),
         )
        ],
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log into\nyour account',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  height: 2
              ),
              ),
              SizedBox(height: 40.h),
              CustomFormField(
                  hintText: 'Email address',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: TextEditingController(),
              ),
              SizedBox(height: 20.h),
              CustomFormField(
                hintText: 'Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: 28.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
          
                  onPressed: () {
          
                  },
                  child: Text("Forgot password?",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 12.sp,
                  ),
                ),
              ),
              ),
              SizedBox(height: 25.h),
              Center(
                child: ElevatedButton(
                    onPressed: () {
          
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
        ),
      ),
    );
  }
}
