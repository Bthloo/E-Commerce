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
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected ?
                  const Color(0xff3A2C27) :
                   Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: isSelected ?
                const Color(0xff3A2C27) :
                const Color(0xffF3F3F3),
                radius: 25.r,
                child: Icon(
                  icon,
                  size: 25.r,
                  color: isSelected ?
                  const Color(0xffFFFFFF) :
                  const Color(0xff9D9D9D)
                  ,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ?
                const Color(0xff3A2C27) :
                const Color(0xff9D9D9D)
                ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
