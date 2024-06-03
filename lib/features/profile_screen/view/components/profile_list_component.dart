import 'package:flutter/material.dart';

class ProfileListComponent extends StatelessWidget {
  const ProfileListComponent({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
final void Function()? onTap;
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onTap: onTap,
      title:  Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 16
        )
      ),
      leading:  Icon(
        icon,
        color: Theme.of(context).primaryColorDark,),
      trailing: const Icon(
        Icons.arrow_forward_ios,
       // color: Color(0xff33302E),
      ),
    );
  }
}
