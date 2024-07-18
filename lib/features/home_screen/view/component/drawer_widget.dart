import 'package:b_commerce/features/login_screen/view/pages/login_screen.dart';
import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../../../../themeing/theme_cubit.dart';
import '../../../../themeing/theme_enum.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
        ),
        //backgroundColor: Colors.white,
        child: Column(
            children:   [
              IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
              // const DrawerHeader(
              //
              //    // color: Colors.white
              //   child: DrawerHeaderInsideWidget(
              //       name: "Bassel Alaa",
              //       email: "bassel@gmail.com",
              //     imageUrl: "",
              //   ),
              // ),
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
                onTap: (){

                  if(LoginCubit.currentUserId == null ||  LoginCubit.currentUserToken == null){
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName,
                            (route) => false
                    );
                  }else{
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
                  }

                },
                title: LoginCubit.currentUserId == null ? "Login" : "Logout",
                icon: LoginCubit.currentUserId == null ? Icons.login : Icons.logout,
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
      ),
    );
  }
}
