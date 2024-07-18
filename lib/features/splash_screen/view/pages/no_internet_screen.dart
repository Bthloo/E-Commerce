import 'package:b_commerce/features/splash_screen/view/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});
static const String routeName = 'no_internet_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
               Icons.wifi_off,
               size: 150,
               color: Theme.of(context).textTheme.titleMedium?.color,),
            const SizedBox(height: 20,),
             Text(
              'No Internet Connection',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.bold
              )
            ),
             //SizedBox(height: 10.h,),
            Text(
                'Please Check Your Internet Connection\n And Try Again Later',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 15,

                    fontWeight: FontWeight.bold
                )
            ),
             SizedBox(height: 30.h,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      SplashScreen.routeName,
                      (route) => false,
                  );
                },
                child: Text("Try Again",
                  style:  Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}
