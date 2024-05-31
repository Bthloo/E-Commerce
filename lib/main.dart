import 'package:b_commerce/core/general_components/theme_data.dart';
import 'package:b_commerce/features/home_screen/view/pages/home_screen.dart';
import 'package:b_commerce/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:b_commerce/features/login_screen/view/pages/login_screen.dart';
import 'package:b_commerce/features/register_screen/view/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(context),
        initialRoute: LoginScreen.routeName,
        routes: {
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
        },
      ),
    );
  }
}
