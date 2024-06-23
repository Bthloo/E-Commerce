import 'package:b_commerce/features/home_screen/viewmodel/get-categories_viewmodel/get_categories_cubit.dart';
import 'package:b_commerce/features/product_from_category_screen/view/pages/products_from_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../pages/home_tab.dart';
import 'category_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120.h,
      child: BlocProvider(
        create: (context) => GetCategoriesCubit()..getCategory(),
        child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesLoading) {
              return ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
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
                             Container(
                               padding: const EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30.r),
                                 border: Border.all(
                                  // color: Theme.of(context).colorScheme.onPrimary,
                                   width: 2.0,
                                 ),
                               ),
                               child: CircleAvatar(
                                // backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                 radius: 25.r,
                                 child: Container(
                                   height: 25.r,
                                   width: 25.r,
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                             const SizedBox(height: 5),
                             Container(
                               height: 10.h,
                               width: 50.w,
                               color: Colors.grey,
                             ),
                           ],
                         ),
                       ),
                   )
                 );
                },
                addSemanticIndexes: true,

                scrollDirection: Axis.horizontal,


                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 1,
                //   //crossAxisSpacing: 10.0,
                //     mainAxisSpacing: 0,
                //   childAspectRatio: 1.13,
                //
                //
                // ),
              );
            } else if (state is GetCategoriesError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is GetCategoriesSuccess) {
              return ListView.builder(
                itemCount: state.categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    onTap: () {

                      Navigator.of(context).pushNamed(
                          ProductsFromCategoryScreen.routeName,
                        arguments: ProductsFromCategoryArgument(
                          id: state.categories[index].id!,
                          name: state.categories[index].name!,
                          imageUrl: state.categories[index].imageUrl!
                        )
                      );

                      // if(selectedIndex == index) {
                      //   return;
                      // }else {
                      //   setState(() {
                      //   selectedIndex = index;
                      //   for (var element in categoryItems) {
                      //     element.isSelected = false;
                      //   }
                      //   categoryItems[index].isSelected = true;
                      // });
                      // }

                    },
                    title:  state.categories[index].name!,
                    url:  "https://5.imimg.com/data5/RB/CN/MY-39077357/mens-fashion-shirt-1000x1000.jpg"
                  //  state.categories[index].imageUrl!,

                  );
                },
                addSemanticIndexes: true,

                scrollDirection: Axis.horizontal,


                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 1,
                //   //crossAxisSpacing: 10.0,
                //     mainAxisSpacing: 0,
                //   childAspectRatio: 1.13,
                //
                //
                // ),
              );
            }else{
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class ProductsFromCategoryArgument{
  final num id;
  final String name;
  final String imageUrl;
  ProductsFromCategoryArgument({required this.id,required this.name,required this.imageUrl});
}

