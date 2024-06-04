import 'package:b_commerce/features/profile_screen/view/pages/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home_screen/view/component/drawer_header_inside_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(
          horizontal: 20.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DrawerHeaderInsideWidget(
              name: "Bassel Alaa",
              email: "bassel@gmail.com"
          ),
          IconButton(
            style: ButtonStyle(
             overlayColor: WidgetStateProperty.all<Color>(
                 Colors.grey.withOpacity(0.3)
             ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, EditProfileScreen.routeName);
            },
            icon:  Icon(
              Icons.edit,
              color: Theme.of(context).primaryColorDark,
            ),
          )
        ],
      ),
    );
  }
}
