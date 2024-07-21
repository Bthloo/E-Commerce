import 'package:b_commerce/features/home_screen/view/pages/all_categories_screen.dart';
import 'package:b_commerce/features/home_screen/viewmodel/get-categories_viewmodel/get_categories_cubit.dart';
import 'package:b_commerce/features/product_from_category_screen/view/pages/products_from_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/models/products_from_category_model.dart';
import 'custom_category_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoriesCubit()..getCategory(),
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
           return SizedBox(
               child: Shimmer.fromColors(
                 baseColor: Colors.grey[300]!,
                 highlightColor: Colors.grey[100]!,
                 child: Padding(
                     padding:  EdgeInsets.symmetric(
                         horizontal:  5.0.w,
                         vertical: 5.0.h
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Categories",
                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             TextButton(
                               onPressed: () {

                               },
                               child: Text(
                                 "See All",
                                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                   fontSize: 18,
                                   color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.6),
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ],

                         ),
                         SizedBox(
                           width: double.infinity,
                           height: 80.h,
                           child: ListView.separated(
                             separatorBuilder: (context, index) {
                               return const SizedBox(width: 5);
                             },
                             itemCount: 5,
                             shrinkWrap: true,
                             itemBuilder: (context, index) {
                               return CustomCategoryItem(
                                 title: "                 ",
                                 onTap: () {
                                 },
                               );
                             },
                             addSemanticIndexes: true,
                             scrollDirection: Axis.horizontal,
                           ),
                         ),
                       ],
                     )

                   // Column(
                   //   children: [
                   //     Container(
                   //       padding: const EdgeInsets.all(5),
                   //       decoration: BoxDecoration(
                   //         borderRadius: BorderRadius.circular(30.r),
                   //         border: Border.all(
                   //          // color: Theme.of(context).colorScheme.onPrimary,
                   //           width: 2.0,
                   //         ),
                   //       ),
                   //       child: CircleAvatar(
                   //        // backgroundColor: Theme.of(context).colorScheme.onPrimary,
                   //         radius: 25.r,
                   //         child: Container(
                   //           height: 25.r,
                   //           width: 25.r,
                   //           color: Colors.white,
                   //         ),
                   //       ),
                   //     ),
                   //     const SizedBox(height: 5),
                   //     Container(
                   //       height: 10.h,
                   //       width: 50.w,
                   //       color: Colors.grey,
                   //     ),
                   //   ],
                   // ),
                 ),
               )
           );
          } else if (state is GetCategoriesError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is GetCategoriesSuccess) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AllCategoriesScreen.routeName,
                          arguments: state.categories,
                        );
                      },
                      child: Text(
                        "See All",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],

                ),
                SizedBox(
                  width: double.infinity,
                  height: 80.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 5);
                    },
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomCategoryItem(
                        title: state.categories[index].name!,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                ProductsFromCategoryScreen.routeName,
                              arguments: ProductsFromCategoryArgument(
                                id: state.categories[index].slug!,
                                name: state.categories[index].name!,
                               // imageUrl: state.categories[index].!
                              )
                            );
                          },
                      );

                      //   CategoryItem(
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed(
                      //         ProductsFromCategoryScreen.routeName,
                      //       arguments: ProductsFromCategoryArgument(
                      //         id: state.categories[index].slug!,
                      //         name: state.categories[index].name!,
                      //        // imageUrl: state.categories[index].!
                      //       )
                      //     );
                      //   },
                      //   title:  state.categories[index].name!,
                      //   url:  "https://5.imimg.com/data5/RB/CN/MY-39077357/mens-fashion-shirt-1000x1000.jpg"
                      // //  state.categories[index].imageUrl!,
                      //
                      // );
                    },
                    addSemanticIndexes: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class ProductsFromCategoryArgument{
  final String id;
  final String name;
  final String? imageUrl;
  final List<Products>? products;
  ProductsFromCategoryArgument({required this.id,required this.name, this.imageUrl,this.products});
}

