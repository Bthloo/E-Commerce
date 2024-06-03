import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.id,
  });
final String title;
final String image;
final String price;
final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag : "$id$image",
          child: Container(
            width: 136.w,
            height: 182.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xffF5F5F5),
              image:  DecorationImage(
                image: AssetImage(
                    image
                ),
                fit: BoxFit.cover,
              ),
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
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
