import 'package:b_commerce/features/item_details_screen/view/components/review_item.dart';
import 'package:b_commerce/features/item_details_screen/view/components/reviews_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/general_components/custom_expansion_tile.dart';
import '../../../../core/models/ProductsFromCategoryModel.dart';

class ReviewsExpansionTile extends StatelessWidget {
  const ReviewsExpansionTile({super.key,required this.reviews,this.rating});
final  List<Reviews>? reviews;
final double? rating;
  @override
  Widget build(BuildContext context) {
    return  CustomExpansionTile(
      title:  "Reviews",
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0.w,
            vertical: 15.0.h,
          ),
          child: Column(
            children: [
              ReviewsRow(rating: rating),
              SizedBox(height: 20.h),
              reviews == null || reviews!.isEmpty
                  ? const Center(child: Text("No Reviews Yet"))
                  : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                    return ReviewItem(
                      reviews: reviews![index],
                    );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: reviews?.length ?? 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
