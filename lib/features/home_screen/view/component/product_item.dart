import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/general_components/color_helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.id,
    required this.sale,
  });
final String title;
final String image;
final num price;
final num sale;
final String id;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              Hero(
                tag : id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                      width: 136.w,
                      height: 182.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                          color:Theme.of(context).colorScheme.inversePrimary
                       // color: const Color(0xffF5F5F5),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: image,
                         fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return const Center(child: Text("Error Loading Image"));
                          },
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 136.w,
                                  height: 182.h,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffF5F5F5),
                                  ),
                                ),
                              )
                      )
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 136.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 136.w /2,
                          child: Text(
                            "${((price)-(price * sale / 100)).ceilToDouble()} \$" ,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 136.w /2,
                          child: Text(
                            price.toString(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.5),
                                decoration: TextDecoration.lineThrough,
                              decorationColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.5)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 5.h,
            left: 5.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text("- $sale %",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorHelper.darkThemeColor,
                      overflow: TextOverflow.ellipsis
                  )
                ),
              ),
            ),
            ),
          )
        ],

      ),
    );
  }
}
