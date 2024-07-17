import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key,required this.title,required this.onTap});
 final String title;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(8.r),
        child: Center(
          child: Container(
          padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            child: Container(
              padding:  EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Center(
                child: Text(title,style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),textAlign: TextAlign.center,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
