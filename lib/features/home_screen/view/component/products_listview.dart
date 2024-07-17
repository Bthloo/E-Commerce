import 'package:b_commerce/features/home_screen/view/component/product_item.dart';
import 'package:b_commerce/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:b_commerce/features/product_from_category_screen/view/pages/products_from_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/ProductsFromCategoryModel.dart';
import 'categories_wedgit.dart';



class ProductsListview extends StatelessWidget {
  const ProductsListview({
    super.key,
    required this.title,
    required this.products,

  });

  final String title;
  final List<Products> products;




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    ProductsFromCategoryScreen.routeName,
                    arguments: ProductsFromCategoryArgument(
                      name: title,
                      products: products,
                      id: "-99",
                    )
                );
              },
              child:  Text(
                "See All",
                style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.6),

                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 250.h,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {
                 Navigator.of(context).pushNamed(
                     ItemDetailsScreen.routeName,
                   arguments:products[index],

                 );
                },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 5.0.w,
                        vertical: 5.0.h
                    ),
                    child: ProductItem(
                        id: products[index].id.toString(),
                        title:  products[index].title ?? "No Title",
                        image:  products[index].thumbnail ?? "No Image",
                        sale: products[index].discountPercentage!,
                        price:  products[index].price!,
                    ),
                  )
              );
            },
          ),
        ),
      ],
    );
  }
}



