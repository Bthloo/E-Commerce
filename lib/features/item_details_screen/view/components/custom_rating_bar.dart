import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key,this.rating});
final double? rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating ??0,
      itemSize: 30,
      unratedColor: const Color(0xff508A7B).withOpacity(.2),
      direction: Axis.horizontal,
      itemCount: 5,
      //itemPadding:  EdgeInsets.symmetric(horizontal: 1.0.w),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color(0xff508A7B),
      ),

    );
  }
}
