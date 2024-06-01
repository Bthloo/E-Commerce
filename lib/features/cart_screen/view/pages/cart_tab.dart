import 'package:b_commerce/features/cart_screen/view/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              SizedBox(height: 20.h,),
              CartItem(
                  image: "assets/images/bestSale.png",
                  title: "Long Sleeve Dress",
                  price: 1200.toString(),
                  size: "M",
                  color: "Black",
                  quantity: 1
              ),
              SizedBox(height: 20.h,),
              CartItem(
                  image: "assets/images/bestSale.png",
                  title: "Long Sleeve Dress",
                  price: 1200.toString(),
                  size: "M",
                  color: "Black",
                  quantity: 1
              ),
              SizedBox(height: 20.h,),
              CartItem(
                  image: "assets/images/bestSale.png",
                  title: "Long Sleeve Dress",
                  price: 1200.toString(),
                  size: "M",
                  color: "Black",
                  quantity: 1
              ),
              SizedBox(height: 20.h,),
              CartItem(
                  image: "assets/images/bestSale.png",
                  title: "Long Sleeve Dress",
                  price: 1200.toString(),
                  size: "M",
                  color: "Black",
                  quantity: 1
              ),
              SizedBox(height: 20.h,),
            ]
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Column(
              children: [
               // SizedBox(height: 10.h,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products Price",
                      style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),),
                    Text(
                      "2400 LE",
                      style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                 Divider(
                  color: Colors.grey.shade200,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping Price",
                      style: TextStyle(
                        fontSize: 20,
                       // fontWeight: FontWeight.bold,
                      ),),
                    Text(
                      "2400 LE",
                      style: TextStyle(
                        fontSize: 20,
                      //  fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                 Divider(
                  color: Colors.grey.shade200,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(
                      "2400 LE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                Spacer(),
          
                ElevatedButton(
          
                  onPressed: () {},
                  child: const Text("Proceed To Check Out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
          ),
                  ),
        )
      ]
    );
  }
}
