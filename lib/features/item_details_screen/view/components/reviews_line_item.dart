import 'package:b_commerce/features/item_details_screen/view/components/reviews_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllReviewsLineItem extends StatelessWidget {
  const AllReviewsLineItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReviewsRow(),
        SizedBox(height: 20.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "5",
              style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            SizedBox(width: 5.w),
            const Icon(
                Icons.star,
                color: Color(0xff508A7B),
                size: 20
            ),

            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0
                ),
              ),
              child: Expanded(
                child: Slider(
                  inactiveColor:  const Color(0xffEFF0F1),
                  autofocus: false,
                  thumbColor: Colors.transparent,
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent
                  ),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xff508A7B),
                  value: 100,
                  onChanged: (value) {

                  },
                  secondaryActiveColor: Colors.transparent,
                ),
              ),
            ),
            Text("20%",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
            ),),

          ],
        ),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "4",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            SizedBox(width: 5.w),
            const Icon(
                Icons.star,
                color: Color(0xff508A7B),
                size: 20
            ),

            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0
                ),
              ),
              child: Expanded(
                child: Slider(

                  inactiveColor:  const Color(0xffEFF0F1),
                  autofocus: false,

                  thumbColor: Colors.transparent,
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent
                  ),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xff508A7B),
                  value: 80,
                  onChanged: (value) {

                  },
                  secondaryActiveColor: Colors.transparent,
                ),
              ),
            ),
            Text(
              "30%",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
              ),),

          ],
        ),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "3",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            SizedBox(width: 5.w),
            const Icon(
                Icons.star,
                color: Color(0xff508A7B),
                size: 20
            ),

            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0
                ),
              ),
              child: Expanded(
                child: Slider(

                  inactiveColor:  const Color(0xffEFF0F1),
                  autofocus: false,

                  thumbColor: Colors.transparent,
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent
                  ),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xff508A7B),
                  value: 60,
                  onChanged: (value) {

                  },
                  secondaryActiveColor: Colors.transparent,
                ),
              ),
            ),
            Text(
              "20%",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
              ),),

          ],
        ),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "2",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            SizedBox(width: 5.w),
            const Icon(
                Icons.star,
                color: Color(0xff508A7B),
                size: 20
            ),

            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0
                ),
              ),
              child: Expanded(
                child: Slider(

                  inactiveColor:  const Color(0xffEFF0F1),
                  autofocus: false,

                  thumbColor: Colors.transparent,
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent
                  ),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xff508A7B),
                  value: 40,
                  onChanged: (value) {

                  },
                  secondaryActiveColor: Colors.transparent,
                ),
              ),
            ),
            Text(
              "10%",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
              ),),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            SizedBox(width: 5.w),
            const Icon(
                Icons.star,
                color: Color(0xff508A7B),
                size: 20
            ),

            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0
                ),
              ),
              child: Expanded(
                child: Slider(
                  inactiveColor:  const Color(0xffEFF0F1),
                  autofocus: false,
                  thumbColor: Colors.transparent,
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent
                  ),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xff508A7B),
                  value: 0,
                  onChanged: (value) {

                  },
                  secondaryActiveColor: Colors.transparent,
                ),
              ),
            ),
            Text(
              "10%",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
              ),),

          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("35 Review",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
              ),),
            TextButton.icon(
              onPressed: (){
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: "dddsds",
                  pageBuilder: (context, anim1, anim2) {
                    return Center(
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          width: 300.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Theme.of(context).colorScheme.surfaceContainer
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20.h),
                                Text("Write a review",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 100.h,
                                  child: TextFormField(
                                    maxLines: null,
                                    minLines: null,
                                    expands: true,
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    decoration:
                                    InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),

                                        ),
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                        //   borderSide: const BorderSide(
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                        hintText: "Enter your review",
                                        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("SUBMIT",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              label: const Icon(Icons.edit),
              icon:  Text(
                "WRITE A REVIEW",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
