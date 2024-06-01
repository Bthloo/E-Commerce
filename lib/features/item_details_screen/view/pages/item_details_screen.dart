import 'package:b_commerce/core/general_components/color_helper.dart';
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
                      color: const Color(0xffFFFFFF),
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
                        color: const Color(0xffFFFFFF),
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
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          args.price,
                          style: const TextStyle(
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
                       Divider(
                        height: 2,
                        color: Colors.grey.shade200,
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
                            child: DropdownMenu(
                            label:  const Text("Color",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),),
                              menuStyle: MenuStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                                ),
                                backgroundColor: const WidgetStatePropertyAll(
                                  Color(0xffF5F5F5),
                                ),

                              ),
                              dropdownMenuEntries:const [
                                DropdownMenuEntry(
                                    value: "Red",
                                    label: 'Red'
                                ),
                                DropdownMenuEntry(
                                    value: "Black",
                                    label: 'Black'
                                ),
                                DropdownMenuEntry(
                                    value: "White",
                                    label: 'White'
                                )
                              ]
                                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:  Colors.grey.shade200,
                            ),
                            child: DropdownMenu(
                                label:  const Text(
                                  "Size",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),),
                                menuStyle: MenuStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                  ),
                                  backgroundColor: const WidgetStatePropertyAll(
                                    Color(0xffF5F5F5),
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
                    ExpansionTile(
                      collapsedShape: BorderDirectional(
                        top: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      shape: BorderDirectional(
                        top: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                        title: const Text(
                          "Description",
                         style: TextStyle(
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
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      collapsedShape: BorderDirectional(
                        top: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      shape: BorderDirectional(
                        top: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      title: const Text(
                        "Reviews",
                        style: TextStyle(
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
                                          const Text(
                                           "3.5",
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Color(0xff231F20),
                                              fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          SizedBox(width: 5.w),
                                          const Text(
                                             "OUT OF 5",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff8A8A8F),
                                              //fontWeight: FontWeight.bold
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
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                                  const Text(
                                    "5",
                                    style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xff8A8A8F),
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
                                  const Text("20%",style: TextStyle(
                                    fontSize: 12,
                                    color:  Colors.black,
                                  ),),

                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("4",style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xff8A8A8F),
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
                                  const Text("30%",style: TextStyle(
                                    fontSize: 12,
                                    color:  Colors.black,
                                  ),),

                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("3",style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xff8A8A8F),
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
                                  const Text("20%",style: TextStyle(
                                    fontSize: 12,
                                    color:  Colors.black,
                                  ),),

                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("2",style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xff8A8A8F),
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
                                  const Text("10%",style: TextStyle(
                                    fontSize: 12,
                                    color:  Colors.black,
                                  ),),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("1",style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xff8A8A8F),
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
                                  const Text("10%",style: TextStyle(
                                    fontSize: 12,
                                    color:  Colors.black,
                                  ),),

                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   const Text("35 Review",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:  Color(0xff8A8A8F),
                                    ),),
                                    TextButton(
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
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 20.h),
                                                        const Text("Write a review",
                                                          style: TextStyle(
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
                                                            decoration:  InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                                                borderSide: const BorderSide(
                                                                  color: Colors.grey,
                                                                ),
                                                              ),
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                                                borderSide: const BorderSide(
                                                                  color: Colors.grey,
                                                                ),
                                                              ),
                                                              hintText: "Enter your review",
                                                              hintStyle: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>
                                                              ( EdgeInsets.symmetric(
                                                                vertical: 10.h,
                                                                horizontal: 50.w
                                                            )
                                                            ),
                                                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(15.r),
                                                                )
                                                            ),
                                                            foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text("SUBMIT",style: TextStyle(
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
                                    child: const Text(
                                      "WRITE A REVIEW",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff3A2C27),
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
                                      const Text("John Doe",
                                        style: TextStyle(
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
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc",
                              style: TextStyle(
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
                                      const Text("John Doe",
                                        style: TextStyle(
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
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
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
                            foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
                          ),
                            onPressed: () {

                            ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                     side: const BorderSide(
                                         color: Colors.grey
                                     )

                                   ),
                                   showCloseIcon: true,
                                    content: const Text("Added to cart"),
                                  backgroundColor: Colors.white,
                                  action: SnackBarAction(
                                    label: "UNDO",
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                           SnackBar(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(
                                                    color: Colors.grey
                                                )

                                            ),
                                            showCloseIcon: true,
                                            content: Text("Removed from cart"),
                                            backgroundColor: Colors.white,
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
