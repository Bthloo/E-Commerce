import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../../themeing/theme_cubit.dart';
import '../../../../themeing/theme_enum.dart';
import 'drawer_header_inside_widget.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      //backgroundColor: Colors.white,
      child: Column(
          children:   [
            const DrawerHeader(

               // color: Colors.white
              child: DrawerHeaderInsideWidget(
                  name: "Bassel Alaa",
                  email: "bassel@gmail.com"
              ),
            ),
            DrawerItem(
              onTap: (){},
              title: "Settings",
             icon:  Icons.settings_outlined,
            ),
            DrawerItem(
              onTap: (){},
              title: "About Us",
              icon: Icons.info_outline,
            ),
            DrawerItem(
              onTap: (){},
              title: "Contact",
              icon: Icons.mail_outlined,

            ),
            DrawerItem(
              onTap: (){},
              title: "Log Out",
              icon: Icons.logout,
            ),
            const Spacer(),

            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                  //ThemeCubit.get(context).themeValue == true ?
                  Colors.grey.shade200
                      //:
                  //const Color(0xff23262F)
              ),
              child: LiteRollingSwitch(
                animationDuration: const Duration(milliseconds: 400),
                width: 160.w,
                textSize: 19,
                textOnColor: Colors.white,
                textOffColor: Colors.white,
                iconOn: Icons.light_mode,
                iconOff: Icons.dark_mode,
                colorOn: Colors.amber,
                colorOff: Colors.black,
                textOn:  "Light Mode",
                textOff:  "Dark Mode",
                value: ThemeCubit.get(context).themeValue??true,

                onTap: (){

                },
                onDoubleTap: (){},
                onSwipe: (){

                },
                onChanged: (value) {
                  ThemeCubit.get(context).themeValue = value;
                  if(value == true){
                    BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeStateEnum.light);
                  }else{
                    BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeStateEnum.dark);
                  }
                },
              ),
            ),
            SizedBox(height: 30.h,),
          ]
      ),
    );
  }
}
