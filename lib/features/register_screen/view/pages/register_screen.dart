import 'package:b_commerce/core/general_components/custom_form_field.dart';
import 'package:b_commerce/features/login_screen/view/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_screen/view/pages/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'register_screen';
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
                'Create\nyour account',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 2
                ),
              ),
              SizedBox(height: 40.h),
              CustomFormField(
                hintText: 'Enter your name',
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
                isPassword: true,
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
                hintText: 'Confirm password',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: 44.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
          
                  },
                  child: SizedBox(
                    height: 51.h,
                    width: 147.w,
                    child: const Center(
                      child: Text('REGISTER',
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
                  Text("Already have an account?",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context,
                          LoginScreen.routeName
                      );
                    },
                    child: Text('LOGIN',
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
