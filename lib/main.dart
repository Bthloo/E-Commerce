import 'package:b_commerce/features/home_screen/view/pages/all_categories_screen.dart';
import 'package:b_commerce/features/product_from_category_screen/view/pages/products_from_category_screen.dart';
import 'package:b_commerce/themeing/theme_data.dart';
import 'package:b_commerce/features/home_screen/view/pages/home_screen.dart';
import 'package:b_commerce/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:b_commerce/features/login_screen/view/pages/login_screen.dart';
import 'package:b_commerce/features/register_screen/view/pages/register_screen.dart';
import 'package:b_commerce/themeing/theme_cubit.dart';
import 'package:b_commerce/themeing/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/profile_screen/view/pages/edit_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..changeTheme(ThemeStateEnum.initial),
      child: BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, themeState) {
    return ScreenUtilInit(
      designSize:  Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
       // designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeState is ThemeDark ? AppTheme.darkTheme : AppTheme
              .lightTheme,
          initialRoute: LoginScreen.routeName,
          routes: {
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            AllCategoriesScreen.routeName: (context) => const AllCategoriesScreen(),
            ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
            EditProfileScreen.routeName: (context) => const EditProfileScreen(),
            ProductsFromCategoryScreen.routeName: (context) => const ProductsFromCategoryScreen(),
          },
        ),
      );
  },
),
    );
  }
}
