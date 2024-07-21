import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:b_commerce/features/profile_screen/viewmodel/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/models/profile_response_model.dart';
import '../../../login_screen/view/pages/login_screen.dart';
import '../components/profile_card.dart';
import '../components/profile_header.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginCubit.currentUserId == null
        ?  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Login First',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName
                  );

                },
                child:  Text('Login',
                  style:  Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  )
                )
            )
          ],
        ))
        :
       BlocProvider(
  create: (context) => ProfileCubit()..getUserProfile(id: LoginCubit.currentUserId!),
  child: BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    if(state is ProfileLoading){
      return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child:  SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(height: 20.h,),
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.r),
                   color: Colors.grey.shade400,
                 ),
                 height: 70.h,
                 width: double.infinity,
               ),
                SizedBox(height: 50.h,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.shade400,
                  ),
                  height: 350.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      );
    }
    else if(state is ProfileSuccess){
      return ListView(
        children: [
          ProfileHeader(
            gender: state.profileResponseModel.gender!,
            phone: state.profileResponseModel.phone!,
            username: state.profileResponseModel.username!,
            email: state.profileResponseModel.email!,
            name: "${state.profileResponseModel.firstName!} ${state.profileResponseModel.lastName!}",
            imageUrl: state.profileResponseModel.image!,

          ),
          ProfileCard(
            name: "${state.profileResponseModel.firstName!} ${state.profileResponseModel.lastName!}",
            bank: state.profileResponseModel.bank??Bank(),
            address: state.profileResponseModel.address??Address()
          )
        ],
      );
    }else if(state is ProfileError){
      return  Center(
        child: Text('Error : ${state.message}',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold
          )
          ,),
      );
    }
    else{
      return const Center(
        child: Text('Error'),
      );
    }
  },
),
);
  }
}
