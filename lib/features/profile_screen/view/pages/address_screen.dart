import 'package:b_commerce/core/models/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
static const String routeName = 'address_screen';
  @override
  Widget build(BuildContext context) {
    Address address = ModalRoute.of(context)!.settings.arguments as Address;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          physics:const ClampingScrollPhysics(),
          children: [
           Text(
             "Address : ${address.address ?? "You didn't add a address"}",
             style: Theme.of(context).textTheme.titleMedium!.copyWith(
               fontSize: 20
             ),
           ),
            SizedBox(height: 10.h,),
            Text(
             "City : ${address.city ?? "You didn't add a city"}"  ,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 10.h,),

            Text(
              "State : ${address.state ?? "You didn't add a state"}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 10.h,),

            Text(
              "Country : ${address.city ?? "You didn't add a country"}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 40.h,),
            ElevatedButton(

              onPressed: () async {
                await openMap(address.coordinates!.lat!, address.coordinates!.lng!);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Text('Open in Map',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> openMap(double latitude, double longitude) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final String appleMapsUrl = 'https://maps.apple.com/?q=$latitude,$longitude';

    if (await canLaunchUrlString(googleMapsUrl)) {
      await launchUrlString(googleMapsUrl);
    } else if (await canLaunchUrlString(appleMapsUrl)) {
      await launchUrlString(appleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }


}
