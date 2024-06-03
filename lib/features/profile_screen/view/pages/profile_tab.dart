import 'package:flutter/material.dart';
import '../components/profile_card.dart';
import '../components/profile_header.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        ProfileHeader(),
        ProfileCard()
    ],
    );
  }
}
