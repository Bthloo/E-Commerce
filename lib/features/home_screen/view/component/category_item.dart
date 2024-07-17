import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
   const CategoryItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.url,

   // required this.icon,
   // required this.isSelected,
   // required this.index,
  });
 final void Function()? onTap;
 final String title;
 final String url;

 //final IconData icon;
 // bool isSelected;
 //final int index;

@override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(
            vertical : 5.h,
            horizontal: 5.0.w
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary,
                  // isSelected ?
                  //  Theme.of(context).colorScheme.onPrimary :
                  //  Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                // isSelected ?
                // Theme.of(context).colorScheme.onPrimary :
                // Theme.of(context).colorScheme.inversePrimary,
                radius: 25.r,
               
               // backgroundImage:
                //CachedNetworkImageProvider(url),
                child: ClipRRect(
                  //clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(25.r),
                  child: CachedNetworkImage(
                    imageUrl: url,
                   // height: 25.r,
                   // width: 25.r,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) {
                      return  CircleAvatar(
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor: Colors.grey,
                            )
                        ),
                      );

                    },
                    errorWidget: (context, url, error) => const Icon(Icons.priority_high,color: Colors.white,),
                  ),
                ),

                // Icon(
                //   icon,
                //   size: 25.r,
                //   color: isSelected ?
                //    Theme.of(context).primaryColor :
                //   Theme.of(context).colorScheme.secondary
                //   ,
                // ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 70.w,
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                 // fontWeight: isSelected ? FontWeight.bold :
                  //FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary
                  // isSelected ?
                  // Theme.of(context).colorScheme.onPrimary :
                  // Theme.of(context).colorScheme.secondary
                  ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
