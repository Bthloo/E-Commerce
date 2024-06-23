import 'dart:ui';

import 'package:b_commerce/features/home_screen/view/component/categories_wedgit.dart';
import 'package:b_commerce/features/home_screen/view/component/product_item.dart';
import 'package:b_commerce/features/product_from_category_screen/viewmodel/get_products_from_category_cubit/get_products_from_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/models/product_item.dart';
import '../../../home_screen/view/component/category_item.dart';
import '../../../item_details_screen/view/pages/item_details_screen.dart';

class ProductsFromCategoryScreen extends StatelessWidget {
  const ProductsFromCategoryScreen({super.key});
  static const String routeName = 'ProductsFromCategoryScreen';
  @override
  Widget build(BuildContext context) {
    ProductsFromCategoryArgument arg = ModalRoute.of(context)!
        .settings
        .arguments as ProductsFromCategoryArgument;
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.transparent)),
          ),
          title: Text(arg.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocProvider(
            create: (context) => GetProductsFromCategoryCubit()
              ..getProductsFromCategory(categoryId: arg.id),
            child: BlocBuilder<GetProductsFromCategoryCubit,
                GetProductsFromCategoryState>(builder: (context, state) {
              if (state is GetProductsFromCategoryLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1 / 1.5,
                          crossAxisSpacing: 10.h,
                          mainAxisSpacing: 10.w,
                          mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 136.w,
                              height: 182.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xffF5F5F5),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 136.w,
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: const Color(0xffF5F5F5),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              } else if (state is GetProductsFromCategoryError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is GetProductsFromCategorySuccess) {
                return GridView.builder(
                    itemCount: 1,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.w,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 10.h,
                        //mainAxisSpacing: 10.w,
                        mainAxisExtent: 250.h
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                              Navigator.of(context).pushNamed(
                                  ItemDetailsScreen.routeName,
                              arguments: ProductItemModel(
                                image:"https://i.pinimg.com/564x/4d/ac/af/4dacafec492a7c25d490eedd6d7dfc88.jpg",
                                  description: "Description",
                                  id: "dsdsd",
                                  price: "${state.products.first.price}",
                                  title: "${state.products.first.name}",
                                  //product: state.products[index]
                              )
                                            );

                        },
                        child: Padding(
                          padding:   EdgeInsets.only(top: 10.h),
                          child: ProductItem(
                            title: state.products.first.name!,
                            image:
                                "https://i.pinimg.com/564x/4d/ac/af/4dacafec492a7c25d490eedd6d7dfc88.jpg",
                            price: "${state.products.first.price}",
                            id: "dsdsd",
                          ),
                        ),
                      );
                    });
              } else {
                return const SizedBox();
              }
            }),
          ),
        ));
  }
}
