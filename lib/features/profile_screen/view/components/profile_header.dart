import 'package:b_commerce/features/profile_screen/view/pages/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home_screen/view/component/drawer_header_inside_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.username,
    required this.gender,
    required this.phone,
    required this.imageUrl
  });
final String name;
final String email;
final String imageUrl;
final String username;
final String gender;
final String phone;
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
           DrawerHeaderInsideWidget(
              name: name,
              email: email,
              imageUrl: imageUrl,
          ),
          IconButton(
            style: ButtonStyle(
             overlayColor: WidgetStateProperty.all<Color>(
                 Colors.grey.withOpacity(0.3)
             ),
            ),
            onPressed: (){
              Navigator.pushNamed(
                  context, EditProfileScreen.routeName,
                arguments: ProfileArgument(
                  firstName: name.split(' ')[0],
                  lastName: name.split(' ')[1],
                  email: email,
                  imageUrl: imageUrl,
                  username: username,
                  phone: phone,
                  gender: gender
              )
              );
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

class ProfileArgument{
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String username;
  final String phone;
  final String gender;
  ProfileArgument({
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.gender,
    required this.imageUrl
  });
}
