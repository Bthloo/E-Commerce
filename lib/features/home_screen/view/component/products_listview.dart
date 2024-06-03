import 'package:b_commerce/features/home_screen/view/component/product_item.dart';
import 'package:b_commerce/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/product_item.dart';



class ProductsListview extends StatelessWidget {
  const ProductsListview({
    super.key,
    required this.title,
    required this.products,
    //required this.onShowAllPressed,
    //required this.onItemPressed,
  });

  final String title;
  final List<ProductItemModel> products;
  //final void Function()? onShowAllPressed;
  //final void Function()? onItemPressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              onPressed: (){

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
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          height: 250.h,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w);
            },
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {
                 Navigator.of(context).pushNamed(
                     ItemDetailsScreen.routeName,
                   arguments: ProductItemModel(
                       title: products[index].title,
                       description: products[index].description,
                       price: products[index].price,
                       image: products[index].image,
                        id: products[index].id
                   )
                 );
                },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 5.0.w,
                        vertical: 5.0.h
                    ),
                    child: ProductItem(
                        id: products[index].id,
                        title:  products[index].title,
                        image:  products[index].image,
                        price:  products[index].price
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



