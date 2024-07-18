import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//ignore: must_be_immutable
class CartItem extends StatelessWidget {
   CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
     this.size,
     this.color,
     required this.discount,
    required this.quantity,
    required this.discountPercentage,
  });
final String image;
final String title;
final num price;
final num discount;
   final num discountPercentage;

final String? size;
final String? color;
 int quantity;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 10.w,
      //   vertical: 10.h,
      // ),
      // margin: EdgeInsets.symmetric(
      //   horizontal: 10.w,
      // ),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 10.w,
      //   vertical: 10.h,
      // ),
      // decoration: BoxDecoration(
      //   color: const Color(0xffFFFFFF),
      //   borderRadius: BorderRadius.circular(20.r),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Colors.grey,
      //       spreadRadius: 0,
      //       blurRadius: 10,
      //       offset: Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      // ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration:  BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                  image: CachedNetworkImageProvider(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Expanded(
             // width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),),
                  SizedBox(height: 10.h,),
                   Row(
                     children: [
                       Text(
                         "-$discountPercentage%",
                         style:
                         Theme.of(context).textTheme.titleMedium!.copyWith(
                           fontSize: 17,
                           fontWeight: FontWeight.bold,
                           color: Colors.red,
                           overflow: TextOverflow.ellipsis,
                         ),),
                       SizedBox(width: 8.w,),
                       Text(
                         "$discount\$",
                        style:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),),
                     ],
                   ),
                  SizedBox(height: 3.h,),
                  Text(
                    "${price.ceilToDouble()}\$",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      overflow: TextOverflow.ellipsis,
                    ),),
                   // Text("Size: $size | Color: $color",
                   //  style: const TextStyle(
                   //    fontSize: 12,
                   //    color: Color(0xff8A8A8F),
                   //  ),),
                ],
              ),
            ),
            //const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffE0E0E0),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    children: [
                      InkWell(
                          onTap: () {
                            if(quantity >= 9){
                              return ;}
                            else{
                              setState(() {
                                quantity++;
                              });
                            }

                          },
                          child:  Text("+",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 20,
                              //  fontWeight: FontWeight.bold
                          )
                          )
                      ),
                      SizedBox(width: 10.w,),
                      //  const SizedBox(width: 5),
                      Text(
                        "$quantity",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(width: 10.w,),
                      // const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          if(quantity <= 1){
                            return ;
                          }else{
                            setState(() {
                              quantity--;
                            });
                          }

                        },
                        child:  Text("-",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 20,
                              //  fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],


        ),
      ),
    );
  }
}
