import 'package:b_commerce/features/profile_screen/view/components/profile_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
                },
                title: 'Address',
                icon: Icons.location_on_outlined,
              ),
              const Divider(
               // color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {},
                title: 'Payment Method',
                icon: Icons.payment_outlined,
              ),
              const Divider(
                //color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {},
                title: 'Voucher',
                icon: Icons.confirmation_num_outlined,
              ),
              const Divider(
               // color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {},
                title: 'My Wishlist',
                icon: Icons.favorite,
              ),
              const Divider(
//color: Color(0xffd6d6d7),
              ),
              ProfileListComponent(
                onTap: () {},
                title: 'Logout',
                icon: Icons.logout,
              ),

            ],
          ),
        )
    );
  }
}
