import 'package:b_commerce/features/home_screen/view/component/image_slider_item.dart';
import 'package:b_commerce/features/home_screen/viewmodel/best_selling_viewmodel/best_selling_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/categories_wedgit.dart';
import '../component/category_item.dart';
import '../component/image_slider_all.dart';
import '../component/products_listview.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          SizedBox(height: 20.h),
          const CategoriesWidget(),
          SizedBox(height: 30.h),
          const ImageSliderAll(),
          SizedBox(height: 35.h),
          BlocProvider(
            create: (context) => BestSellingCubit()..getBestSelling(),
            child: BlocBuilder<BestSellingCubit, BestSellingState>(
              builder: (context, state) {
                if(state is BestSellingLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is BestSellingError) {
                  return Center(child: Text(state.message),);
                }else if(state is BestSellingLoaded) {
                  return ProductsListview(
                    title: "Best Selling",
                    products: state.products,
                  );
                }else {
                  return const SizedBox();
                }
              },
            ),
          ),
          // SizedBox(height: 30.h),
          // BlocProvider(
          //   create: (context) =>
          //   BestSellingCubit()
          //     ..getBestSelling(),
          //   child: BlocBuilder<BestSellingCubit, BestSellingState>(
          //     builder: (context, state) {
          //       if(state is BestSellingLoading) {
          //         return const Center(child: CircularProgressIndicator(),);
          //       }else if(state is BestSellingError) {
          //         return Center(child: Text(state.message),);
          //       }else if(state is BestSellingLoaded) {
          //         return ProductsListview(
          //           title: "Recommended for you",
          //           products: state.products,
          //         );
          //       }else {
          //         return const SizedBox();
          //       }
          //     },
          //   ),
          // ),
          // SizedBox(height: 30.h),
          // BlocProvider(
          //   create: (context) =>
          //   BestSellingCubit()
          //     ..getBestSelling(),
          //   child: BlocBuilder<BestSellingCubit, BestSellingState>(
          //     builder: (context, state) {
          //       if(state is BestSellingLoading) {
          //         return const Center(child: CircularProgressIndicator(),);
          //       }else if(state is BestSellingError) {
          //         return Center(child: Text(state.message),);
          //       }else if(state is BestSellingLoaded) {
          //         return ProductsListview(
          //           title: "Top Collection",
          //           products: state.products,
          //         );
          //       }else {
          //         return const SizedBox();
          //       }
          //     },
          //   ),
          // ),
          // SizedBox(height: 30.h),

        ],
      ),
    );
  }

}

List<CategoryItem> categoryItems = [
  CategoryItem(
    onTap: () {
      debugPrint("dsds");
    },
    icon: Icons.male,
    title: "Men",
    index: 0,
    isSelected: true,
  ),
  CategoryItem(
    onTap: () {

    },
    icon: Icons.female,
    title: "Women",
    index: 1,
    isSelected: false,
  ),
  CategoryItem(
    onTap: () {

    },
    icon: CupertinoIcons.eyeglasses,
    title: "Accessories",
    index: 2,
    isSelected: false,
  ),
  CategoryItem(
    onTap: () {

    },
    icon: Icons.monitor,
    title: "Electronics",
    index: 3,
    isSelected: false,
  ),
];

List<ImageSliderItem> imagesSlider = [
  ImageSliderItem(
    title: "New Collection",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
  ImageSliderItem(
    title: "Summer Sale",
    image: "assets/images/autmn_collection.png",
    onTap: () {
      debugPrint("Summer Sale");
    },
  ),
  ImageSliderItem(
    title: "Winter Sale",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
  ImageSliderItem(
    title: "Black Friday",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
];

