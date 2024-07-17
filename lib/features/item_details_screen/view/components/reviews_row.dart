import 'package:b_commerce/features/item_details_screen/view/components/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsRow extends StatelessWidget {
  const ReviewsRow({super.key, this.rating});
final double? rating;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$rating",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                "OUT OF 5",
                style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),
              ),
            ]
        ),
        CustomRatingBar(rating: rating??0),

      ],
    );
  }
}
