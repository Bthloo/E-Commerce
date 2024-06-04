import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.index,
  });
 final void Function()? onTap;
 final String title;
 final IconData icon;
  bool isSelected;
 final int index;

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
                  color: isSelected ?
                   Theme.of(context).colorScheme.onPrimary :
                   Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: isSelected ?
                Theme.of(context).colorScheme.onPrimary :
                Theme.of(context).colorScheme.inversePrimary,
                radius: 25.r,
                child: Icon(
                  icon,
                  size: 25.r,
                  color: isSelected ?
                   Theme.of(context).primaryColor :
                  Theme.of(context).colorScheme.secondary
                  ,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold :
                FontWeight.w600,
                color: isSelected ?
                Theme.of(context).colorScheme.onPrimary :
                Theme.of(context).colorScheme.secondary
                ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
