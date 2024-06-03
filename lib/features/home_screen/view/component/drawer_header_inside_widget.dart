import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerHeaderInsideWidget extends StatelessWidget {
  const DrawerHeaderInsideWidget({
    super.key,
    required this.name,
    required this.email,
  });
final String name;
final String email;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              //backgroundImage: AssetImage("assets/images/profile.png"),
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
