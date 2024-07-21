import 'package:b_commerce/features/cart_screen/view/components/cart_item.dart';
import 'package:b_commerce/features/cart_screen/viewmodel/get_cart_viewmodel/get_cart_cubit.dart';
import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../login_screen/view/pages/login_screen.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginCubit.currentUserId == null ?
    Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Login First',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName
                  );

                },
                child:  Text('Login',
                    style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    )
                )
            )
          ],
        ))
     : BlocProvider(
      create: (context) => GetCartCubit()..getCart(),
      child: BlocBuilder<GetCartCubit,GetCartState>(
      builder: (context, state) {
        if (state is GetCartLoading){
          return const Center(child: CircularProgressIndicator());
        }else if(state is GetCartSuccess){
          if(state.cart.isEmpty){
            return const Center(child: Text('The Cart is Empty'));
          }else{
            return Stack(
            //  alignment: Alignment.bottomCenter,
              children: [
                ListView.separated(
                  itemBuilder: (context, index) {
                    return CartItem(
                      image: state.cart[0].products![index].thumbnail!,
                      price: state.cart[0].products![index].total!,
                      discount: state.cart[0].products![index].discountedTotal!,
                      discountPercentage: state.cart[0].products![index].discountPercentage!,

                      title: state.cart[0].products![index].title!,
                      quantity:state.cart[0].products![index].quantity!,

                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                  itemCount: state.cart[0].products!.length,
                ),

                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      )),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        isDismissible: true,
                        showDragHandle: true,
                      isScrollControlled: false,
                      //  constraints: BoxConstraints(
                          //maxHeight: 400.h,
                       // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            width: 4,
                          ),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                                children: [
                                  // SizedBox(height: 10.h,),
                                  IconButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                      icon: const Icon(Icons.clear,color: Colors.red,)),
                                  SizedBox(height: 10.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Products Price",
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text(
                                          "${state.cart[0].total! + state.cart[0].discountedTotal!}",
                                          style:Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Discount",
                                          style:Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                          )),
                                      Text(
                                          state.cart[0].discountedTotal!.toString()
                                          ,
                                          style:Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Total Price",
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                          state.cart[0].total!.toString()
                                          ,
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 30.h,),
                                  ElevatedButton(

                                    onPressed: () {},
                                    child: const Text("Proceed To Check Out",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Show Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]
            );
          }

        }else if(state is GetCartError){
          return Center(child: Text(state.message));
        }else {
          return const Center(child: Text('Unknown State'));
        }

      },
    ),
    );
  }
}
