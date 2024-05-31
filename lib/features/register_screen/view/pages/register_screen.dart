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
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create\nyour account',
              style: TextStyle(
                height: 2,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
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
                  child: Center(
                    child: Text('REGISTER',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffFFFFFF)
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
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
