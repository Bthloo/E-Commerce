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
              'Log into\nyour account',
              style: TextStyle(
                height: 2,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
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
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    //fontWeight: FontWeight.w500
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
                    child: Center(
                      child: Text('LOGIN',
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
                Text("Don't have an account?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
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
