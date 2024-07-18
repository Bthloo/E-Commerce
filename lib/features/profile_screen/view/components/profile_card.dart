import 'package:b_commerce/core/general_components/build_show_toast.dart';
import 'package:b_commerce/core/models/ProfileResponseModel.dart';
import 'package:b_commerce/features/profile_screen/view/components/profile_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../login_screen/view/pages/login_screen.dart';
import '../../../login_screen/viewmodel/login_cubit.dart';
import '../pages/address_screen.dart';
import '../pages/payment_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key,required this.address,required this.bank,required this.name});
final Address address;
final Bank bank;
final String name;
  @override
  Widget build(BuildContext context) {
    return  Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        elevation: 4,
        child : Padding(
          padding:  EdgeInsets.symmetric(
              vertical: 7.h
          ),
          child: Column(
            children: [
              ProfileListComponent(
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      AddressScreen.routeName,
                      arguments: address
                  );
                },
                title: 'Address',
                icon: Icons.location_on_outlined,
              ),
              const Divider(
               // color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      PaymentScreen.routeName,
                      arguments: PaymentMethodArgument(
                        name: name,
                        bank: bank
                      )
                  );
                },
                title: 'Payment Method',
                icon: Icons.payment_outlined,
              ),
              const Divider(
                //color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {
                  buildShowToast("You have no vouchers yet");
                },
                title: 'Voucher',
                icon: Icons.confirmation_num_outlined,
              ),
              const Divider(
               // color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {
                  buildShowToast("You have no Wishlist yet");
                },
                title: 'My Wishlist',
                icon: Icons.favorite,
              ),
              const Divider(
//color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(

                  onTap: (){
                    Future.wait([
                      const FlutterSecureStorage().delete(key: 'token'),
                      const FlutterSecureStorage().delete(key: 'id'),
                    ]);
                    LoginCubit.currentUserId = null;
                    LoginCubit.currentUserToken = null;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName,
                            (route) => false
                    );
                  },
                title: 'Logout',
                icon: Icons.logout,
              ),

            ],
          ),
        )
    );
  }
}

class PaymentMethodArgument{
  final Bank bank;
  final String name;
  PaymentMethodArgument({required this.bank,required this.name});
}
