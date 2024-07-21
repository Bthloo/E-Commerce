import 'dart:ui';
import 'package:b_commerce/features/home_screen/viewmodel/appbar_viewmodel/app_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "home-screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomAppBarCubit(),
      child: BlocBuilder<BottomAppBarCubit,BottomAppBarState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (BottomAppBarCubit.get(context).currentTapIndex != 0) {
                BottomAppBarCubit.get(context).changeIndex(0);
                return;
              }else{
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Are you sure you want to exit?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                            // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                            // Navigator.of(context).pop();
                            // Navigator.of(context).pop();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              }

            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              key: BottomAppBarCubit.get(context).scaffoldKey,
              drawer: const DrawerWidget(),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 0,
                      blurRadius: 20,
                     // offset: const Offset(0, -1), // changes position of shadow
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                  ),
                ),
                child: ClipRRect(
                  borderRadius:  BorderRadius.only(
                      topLeft:  Radius.circular(15.r),
                      topRight:Radius.circular(15.r)
                  ),

                  child: BottomNavigationBar(
                    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                      elevation: 0,
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                   // backgroundColor: Colors.white,
                     // fixedColor: Colors.black,
                    //unselectedItemColor: const Color(0xffBEBFC4),
                   // useLegacyColorScheme: false,


                    currentIndex: BottomAppBarCubit.get(context).currentTapIndex,
                    onTap: (index) {
                      BottomAppBarCubit.get(context).changeIndex(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        label: "Home",
                          icon: ImageIcon(
                            AssetImage("assets/icons/home_icon.png"),
                            //size: 30,
                          ),
                      ),
                      BottomNavigationBarItem(
                        label: "Discover",
                        icon: ImageIcon(
                          AssetImage("assets/icons/search_icon.png"),
                          //size: 30,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Cart",
                        icon: ImageIcon(
                          AssetImage("assets/icons/cart_icon.png"),
                          //size: 30,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        icon: ImageIcon(
                          AssetImage("assets/icons/profile_icon.png"),
                          //size: 30,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              appBar: AppBar(
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const ImageIcon(
                        size: 25,
                        AssetImage(
                            "assets/icons/burger_icon.png",
                        ),
                      ),

                    );
                  }
                ),
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color:  Colors.transparent
                      )
                  ),
                ),
                title:  Text(
                  style:  TextStyle(
                    fontFamily: "Mont",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                    BottomAppBarCubit.get(context).titles[BottomAppBarCubit.get(context).currentTapIndex]
                ),
              ),
              body: Center(
                  child: BottomAppBarCubit.get(context).tabs[BottomAppBarCubit.get(context).currentTapIndex]
              ),
            ),
          );
        },
      ),
    );
  }
}
