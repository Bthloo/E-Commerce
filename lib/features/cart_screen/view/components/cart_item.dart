import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
   CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity,
  });
final String image;
final String title;
final String price;
final String size;
final String color;
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
                  image: AssetImage(image),
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
                   Text(
                     price,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),),
                  SizedBox(height: 3.h,),
                   Text("Size: $size | Color: $color",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff8A8A8F),
                    ),),
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
