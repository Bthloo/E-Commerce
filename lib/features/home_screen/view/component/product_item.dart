import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

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
          tag : id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              width: 136.w,
              height: 182.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color(0xffF5F5F5),
                // image:  DecorationImage(
                //   image: CachedNetworkImageProvider(image),
                //   fit: BoxFit.cover
                // )
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                  fit: BoxFit.cover,
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
