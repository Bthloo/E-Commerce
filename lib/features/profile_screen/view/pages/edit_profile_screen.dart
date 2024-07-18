import 'package:b_commerce/core/general_components/custom_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/profile_header.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
static const String routeName = 'editProfileScreen';
  @override
  Widget build(BuildContext context) {
    ProfileArgument argument = ModalRoute.of(context)!.settings.arguments as ProfileArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Profile Settings',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Mont'
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              SizedBox(
                height: 108.97.h,
                width: 103.11.w,
                child: Stack(
                  children: [
                    Container(
                      height: 96.h,
                      width: 96.w,
                      
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(argument.imageUrl)
                        ),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.r)
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 42.h,
                        width: 42.w,
                        decoration: BoxDecoration(
                            color: const Color(0xff353945),
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 74.h,),
             Row(
               children: [
                 Expanded(
                   flex: 3,
                   child: CustomFormField(
                       hintText: "First Name",
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Please enter some text';
                         }
                         return null;
          
                       },
                       controller: TextEditingController(
                         text: argument.firstName
                       )
                   ),
                 ),
                 SizedBox(width: 20.w,),
                 Expanded(
                   flex: 2,
                   child: CustomFormField(
                       hintText: "Second Name",
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Please enter some text';
                         }
                         return null;
          
                       },
                       controller: TextEditingController(
                         text: argument.lastName
                       )
                   ),
                 ),
               ],
             ),
              SizedBox(height: 30.w,),
              CustomFormField(
                  hintText: "User Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;

                  },
                  controller: TextEditingController(
                      text: argument.username
                  )
              ),
              SizedBox(height: 30.w,),
              CustomFormField(
                  hintText: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
          
                  },
                  controller: TextEditingController(
                      text: argument.email
                  )
              ),
              SizedBox(height: 30.w,),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                        hintText: "Phone Number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
          
                        },
                        controller: TextEditingController(
                            text: argument.phone
                        )
                    ),
                  ),
                  SizedBox(width: 20.w,),
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.transparent,
                       border: Border.all(
                         color: Colors.transparent,
                         width: 1
                       ),
                       borderRadius: BorderRadius.circular(15.r),
                      // color:  Colors.grey.shade200,
                     ),
                     child: DropdownMenu(
                       controller: TextEditingController(
                         text: argument.gender
                       ),
                      label:  Text(
                        "Gender",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16
                        ),),
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: "Male",
                              label: "Male"
                          ),
                          DropdownMenuEntry(
                              value: "Female",
                              label: "Female"
                          )
                                   ],
                                 ),
                   ),
          ]
              ),
              SizedBox(height: 100.w,),
              ElevatedButton(
                  onPressed: () {
          
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                        'Save Changes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
