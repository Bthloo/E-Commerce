import 'package:b_commerce/features/home_screen/view/component/products_listview.dart';
import 'package:b_commerce/features/home_screen/viewmodel/best_selling_viewmodel/all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductsSectionWidget extends StatelessWidget {
  const ProductsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) =>
          AllProductsCubit()
            ..getAllProducts(),
          child: BlocBuilder<AllProductsCubit, AllProductsState>(
            builder: (context, state) {
              if (state is AllProductsLoading) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(

                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "         ",
                              style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            TextButton(
                              onPressed: () {

                              },
                              child:  Text(
                                "Show All",
                                style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 250.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10.w,
                            ),
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: 136,
                                    height: 182,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF5F5F5),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    )
                );
              }else if(state is AllProductsLoaded){
                return ProductsListview(
                    title: "Our Products",
                    products: state.products,

                );
              }else if(state is AllProductsError){
                return  Center(
                  child: Text("Error : $state"),
                );
              }else {
                return const Center(
                  child: Text("Error"),
                );
              }

            },
          ),
        ),
      ],
    );
  }
}
