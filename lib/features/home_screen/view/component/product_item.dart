import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
final String title;
final String image;
final String price;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
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
        SizedBox(height: 10.h),
        SizedBox(
          width: 136.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
