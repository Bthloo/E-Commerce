import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.onTap,
  });
final String title;
final String thumbnail;
final num price;
final num discountPercentage;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CachedNetworkImage(
              height: 100.h,
              width: 100.w,
              imageUrl: thumbnail),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150.w,
                child: Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                    )
                ),
              ),
              Row(
                children: [
                  Text("-$discountPercentage%",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16
                    ),),
                  SizedBox(width: 10.w,),
                  Text("${((price) -
                      ((price) *
                          (discountPercentage / 100))).ceilToDouble()
                  }\$",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      )
                  ),
                ],
              ),
              Text("$price\$",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5),
                    color: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5)
                )
                ,),

            ],
          )
        ],
      ),
    );
  }
}
