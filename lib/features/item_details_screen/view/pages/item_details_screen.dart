import 'package:b_commerce/core/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});
static const String routeName = 'item_details_screen';
  @override
  Widget build(BuildContext context) {
    debugPrint("ItemDetailsScreen");
    ProductItemModel args = ModalRoute.of(context)!.settings.arguments as ProductItemModel;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.shopping_cart),
      // ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(

        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              actions: [
                SizedBox(width: 10.w),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: const Color(0xffFFFFFF),
                      color : Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(.7),
                          // spreadRadius: .1,
                          blurRadius: 4,
                          //offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color:  Colors.red,
                      size: 30,
                    ),
        
                  ),
                ),
                SizedBox(width: 10.w),
              ],
              leadingWidth: 50.w,
              leading: Row(
                children: [
                  SizedBox(width: 10.w),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                         horizontal:  5.w,
                        vertical: 5.h
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color : Theme.of(context).primaryColor,
                        //color:  Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(.7),
                            // spreadRadius: .1,
                            blurRadius: 4,
                            //offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,

                        size: 30,
                      ),

                    ),
                  ),
                ],
              ),
              expandedHeight: 432.h,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: "${args.id}${args.image}",
                  child: Image.asset(
                    args.image,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 432.h,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          args.title,
                          style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          args.price,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],),
                    RatingBarIndicator(
                      rating: 3.5,
                      itemSize: 30,
                      unratedColor: const Color(0xff508A7B).withOpacity(.2),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding:  EdgeInsets.symmetric(horizontal: 4.0.w),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xff508A7B),
                      ),

                    ),
                    SizedBox(height: 20.h),
                       const Divider(
                        height: 2,
                      ),
                    SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:  Colors.grey.shade200,
                            ),
                            child:  DropdownMenu(
                            label:  Text(
                              "Color",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                              ),
                            ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                    value: "Red",
                                    label: 'Red',
                                  style: ButtonStyle(
                                    overlayColor: WidgetStatePropertyAll(
                                        Colors.grey.withOpacity(.5)
                                    ),
                                    // foregroundColor: const WidgetStatePropertyAll(
                                    //     AppTheme.whiteColor
                                    // )
                                  )
                                ),
                                DropdownMenuEntry(

                                    value: "Black",
                                    label: 'Black',
                                    style: ButtonStyle(
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.grey.withOpacity(.5)
                                        ),

                                    )
                                ),
                                DropdownMenuEntry(
                                    value: "White",
                                    label: 'White',
                                    style: ButtonStyle(
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.grey.withOpacity(.5)
                                        ),

                                    )
                                )
                              ]
                                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                             // color:  Colors.grey,
                            ),
                            child: DropdownMenu(

                                label:   Text(
                                  "Size",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                dropdownMenuEntries:const [
                                  DropdownMenuEntry(
                                      value: "Small",
                                      label: 'Small'
                                  ),
                                  DropdownMenuEntry(
                                      value: "Medium",
                                      label: 'Medium'
                                  ),
                                  DropdownMenuEntry(
                                      value: "Large",
                                      label: 'Large'
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20.h),
                    const Divider(),
                    ExpansionTile(
                      collapsedShape: const BorderDirectional(
                        top: BorderSide(
                            color: Colors.transparent                        ),
                        bottom: BorderSide(
                            color: Colors.transparent                        ),
                      ),
                      shape: const BorderDirectional(
                        top: BorderSide(
                            color: Colors.transparent                        ),
                        bottom: BorderSide(
                            color: Colors.transparent                        ),
                      ),
                        title:  Text(
                          "Description",
                         style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                         ),),
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 15.0.w,
                            vertical: 15.0.h
                          ),
                          child: Text(
                            args.description,
                            style:Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 16,

                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ExpansionTile(
                      collapsedShape: const BorderDirectional(
                        top: BorderSide(
                        // color: Colors.grey.shade200,
                          color: Colors.transparent
                        ),
                        bottom: BorderSide(
                          //color: Colors.grey.shade200,
                            color: Colors.transparent
                        ),
                      ),
                      shape: const BorderDirectional(
                        top: BorderSide(
                            color: Colors.transparent
                        ),
                        bottom: BorderSide(
                            color: Colors.transparent
                        ),
                      ),
                      title:  Text(
                        "Reviews",
                        style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 15.0.w,
                              vertical: 15.0.h
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                           Text(
                                           "3.5",
                                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                           Text(
                                             "OUT OF 5",
                                            style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ]
                                      ),
                                  RatingBarIndicator(
                                    rating: 3.5,
                                    itemSize: 30,
                                    unratedColor: const Color(0xff508A7B).withOpacity(.2),
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                   // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xff508A7B),
                                    ),

                                  ),

                                ],
                              ),
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
                              SizedBox(height: 40.h),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text("John Doe",
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      RatingBarIndicator(
                                        rating: 3.5,
                                        itemSize: 20,
                                        unratedColor: const Color(0xff508A7B).withOpacity(.2),
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Color(0xff508A7B),
                                        ),

                                      )

                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h),
                               Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 16,
                              ),
                              ),
                              SizedBox(height: 36.h),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("John Doe",
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      RatingBarIndicator(
                                        rating: 3.5,
                                        itemSize: 20,
                                        unratedColor: const Color(0xff508A7B).withOpacity(.2),
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Color(0xff508A7B),
                                        ),

                                      )

                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                                 EdgeInsets.symmetric(
                                   horizontal:15.w,
                                    vertical: 15.h
                                 )
                            ),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                )
                            ),
                           // foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
                          ),
                            onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   showCloseIcon: true,
                                    content: const Text("Added to cart"),
                                 // backgroundColor: Colors.white,
                                  action: SnackBarAction(
                                    label: "UNDO",
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(
                                            showCloseIcon: true,
                                            content: Text("Removed from cart"),
                                           // backgroundColor: Colors.white,
                                          )
                                      );
                                    },
                                  )
                                )
                            );
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("ADD TO CART"),
                                SizedBox(width: 10.w),
                                const Icon(Icons.shopping_cart_outlined)
                              ],
                            ),
                        ),
                        SizedBox(width: 10.w),
                         Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color:  Colors.grey.shade200,
                           ),
                           child: StatefulBuilder(
                             builder: (context, setState) {
                               int quantity = 1;
                               return Row(
                                 children: [
                                   TextButton(
                                       onPressed: () {
                                         setState(() {
                                           quantity++;
                                         });

                                       },
                                       child: const Text("+",
                                         style: TextStyle(
                                           fontSize: 30,
                                           //fontWeight: FontWeight.bold
                                         ),)
                                   ),
                                   //  const SizedBox(width: 5),
                                    Text(
                                     "$quantity",
                                     style: const TextStyle(
                                         fontSize: 30,
                                         fontWeight: FontWeight.bold

                                     ),
                                   ),
                                   // const SizedBox(width: 5),
                                   TextButton(
                                       onPressed: () {
                                         if(quantity <= 1){
                                           return ;
                                         }else{
                                           setState(() {
                                             quantity--;
                                           });
                                         }

                                       },
                                       child: const Text("-",
                                         style: TextStyle(
                                           fontSize: 30,
                                           //  fontWeight: FontWeight.bold
                                         ),)
                                   ),
                                 ],
                               );
                             },
                           ),
                         )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      );

      // ListView(
      //   children: [
      //     Image.asset(
      //       args.image,
      //       width: double.infinity,
      //       fit: BoxFit.fill,
      //       height: 432.h,
      //     ),
      //
      //   ],
      // ),

  }
}
