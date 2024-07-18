import 'package:b_commerce/core/models/ProductsFromCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key,required this.reviews});
 final Reviews? reviews;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
       color: Theme.of(context).colorScheme.inversePrimary
       // color: const Color(0xffF5F5F5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reviews?.reviewerName ?? "NO Name",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: reviews?.rating?.toDouble() ?? 0,
                        itemSize: 20,
                        unratedColor: const Color(0xff508A7B).withOpacity(.2),
                        direction: Axis.horizontal,
                        itemCount: 5,
                        //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0xff508A7B),
                        ),

                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '${reviews?.rating}',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 17,
                          color: const Color(0xff508A7B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )

                ],
              ),

            ],
          ),
          SizedBox(height: 15.h),
          Text(
            reviews?.comment ?? "No Review",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
