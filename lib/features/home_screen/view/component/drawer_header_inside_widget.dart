import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerHeaderInsideWidget extends StatelessWidget {
  const DrawerHeaderInsideWidget({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
final String name;
final String email;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: [
             CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(
                  imageUrl,
              ),
            ),
            SizedBox(width: 10.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style:Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12,
                  ),),
              ],
            )
          ]
      ),
    );
  }
}
