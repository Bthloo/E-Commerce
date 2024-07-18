import 'package:b_commerce/features/home_screen/view/component/products_section_widget.dart';
import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/categories_wedgit.dart';
import '../component/image_slider_all.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(LoginCubit.currentUserToken);
    debugPrint(LoginCubit.currentUserId.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          SizedBox(height: 20.h),
          const CategoriesWidget(),
          SizedBox(height: 30.h),
          const ImageSliderAll(),
          SizedBox(height: 35.h),
          const ProductsSectionWidget(),
          SizedBox(height: 35.h),

        ],
      ),
    );
  }

}





