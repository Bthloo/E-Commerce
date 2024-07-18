import 'package:b_commerce/features/splash_screen/view/pages/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

import '../../../home_screen/view/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String routeName = 'splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async{
      bool result = await InternetConnectionChecker().hasConnection;
      if(mounted){
        if(result == true) {
          Navigator.pushReplacementNamed(
            context, HomeScreen.routeName,
          );
        } else {
          Navigator.pushReplacementNamed(
            context, NoInternetScreen.routeName,
          );
        }
      }



    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/fNonrSaEFn.json',
                width: 250.w,
                fit: BoxFit.contain
            ),
             Text(
              'Bthloo Store',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
             Text(
              '-Just Buy It-',
                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
                   fontSize: 20,
                 )),

          ],
        ),
      ),
    );
  }
}
