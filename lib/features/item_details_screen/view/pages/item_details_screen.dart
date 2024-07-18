import 'package:b_commerce/features/item_details_screen/view/components/description_expansion_tile.dart';
import 'package:b_commerce/features/item_details_screen/view/components/reviews_expansion_tile.dart';
import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/products_from_category_model.dart';
import '../../../login_screen/view/pages/login_screen.dart';
import '../components/product_detail_expansion_tile.dart';
import '../components/product_images_slider.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});
static const String routeName = 'item_details_screen';
  @override
  Widget build(BuildContext context) {
    Products args = ModalRoute.of(context)!.settings.arguments as Products;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: CustomScrollView(
       physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              actions: [
                IconButton.outlined(
                  color: Colors.white,
                    style: ButtonStyle(
                      shadowColor: WidgetStateProperty.all<Color>(
                          Colors.black
                      ),
                      elevation: WidgetStateProperty.all<double>(3.5),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.white
                      ),
                      side: WidgetStateProperty.all<BorderSide>(
                          const BorderSide(
                            color: Colors.transparent,
                          )
                      ),
                      overlayColor: WidgetStateProperty.all<Color>(
                          Colors.grey.withOpacity(.1)
                      ),
                      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory
                    ),

                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                )
              ],

              leading: IconButton.outlined(
                  color: Colors.white,
                  style: ButtonStyle(
                      shadowColor: WidgetStateProperty.all<Color>(
                          Colors.black
                      ),
                      elevation: WidgetStateProperty.all<double>(3.5),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.white
                      ),
                      side: WidgetStateProperty.all<BorderSide>(
                          const BorderSide(
                            color: Colors.transparent,
                          )
                      ),
                      overlayColor: WidgetStateProperty.all<Color>(
                          Colors.grey.withOpacity(.1)
                      ),
                      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )
              ),
              // actions: [
              //   SizedBox(width: 10.w),
              //   InkWell(
              //     borderRadius: BorderRadius.circular(50),
              //     onTap: () {},
              //     child: Container(
              //       padding: const EdgeInsets.all(5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         //color: const Color(0xffFFFFFF),
              //         color : Theme.of(context).primaryColor,
              //         boxShadow: [
              //           BoxShadow(
              //             color: const Color(0xff000000).withOpacity(.7),
              //             // spreadRadius: .1,
              //             blurRadius: 4,
              //             //offset: const Offset(0, 3), // changes position of shadow
              //           ),
              //         ],
              //       ),
              //       child: const Icon(
              //         Icons.favorite,
              //         color:  Colors.red,
              //         size: 30,
              //       ),
              //
              //     ),
              //   ),
              //   SizedBox(width: 10.w),
              // ],

             // leadingWidth: 50.w,
             //  leading: Row(
             //    children: [
             //      SizedBox(width: 10.w),
             //      InkWell(
             //        borderRadius: BorderRadius.circular(50),
             //        onTap: () {
             //          Navigator.pop(context);
             //        },
             //        child: Container(
             //          padding:  EdgeInsets.symmetric(
             //             horizontal:  5.w,
             //            vertical: 5.h
             //          ),
             //          decoration: BoxDecoration(
             //            borderRadius: BorderRadius.circular(50),
             //            color : Theme.of(context).primaryColor,
             //            //color:  Colors.black,
             //            boxShadow: [
             //              BoxShadow(
             //                color: const Color(0xff000000).withOpacity(.7),
             //                // spreadRadius: .1,
             //                blurRadius: 4,
             //                //offset: const Offset(0, 3), // changes position of shadow
             //              ),
             //            ],
             //          ),
             //          child: const Icon(
             //            Icons.arrow_back_ios_new,
             //
             //            size: 30,
             //          ),
             //
             //        ),
             //      ),
             //    ],
             //  ),
              expandedHeight: 432.h,
              floating: false,

              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
               // collapseMode: CollapseMode.pin,
                background: ProductImagesSlider(args: args),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      args.title??"No Title",
                      style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          "-${args.discountPercentage}%",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "${((args.price)!-(args.price !* (args.discountPercentage!/100))).ceilToDouble()}\$",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${args.price}\$",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5),
                          decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5),

                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     CustomRatingBar(rating: args.rating?.toDouble(),),
                    //     Text(
                    //       "${args.rating}",
                    //       style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     )
                    //   ],
                    // ),

                   // SizedBox(height: 20.h),
                   // ColorAndSize(),
                    //SizedBox(height: 20.h),
                    ProductDetailExpansionTile(args: args),
                    const Divider(),
                   DescriptionExpansionTile(description: args.description),
                    const Divider(),
                   ReviewsExpansionTile(reviews: args.reviews,rating: args.rating?.toDouble(),),
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

                            if(LoginCubit.currentUserId == null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      showCloseIcon: true,
                                      content: const Text("Please Login First"),
                                      // backgroundColor: Colors.white,
                                      action: SnackBarAction(
                                        label: "Login",
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              LoginScreen.routeName
                                          );
                                        },
                                      )
                                  )
                              );
                            }else{
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
                            }


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
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      );
  }
}
