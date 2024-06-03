import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
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
    return  ListTile(
      onTap: onTap,
      leading:   Icon(
        icon,
          color: Theme.of(context).primaryColorDark,
      ),
      title:  Text(title,
        style:  TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 16
        ),),
    );
  }
}
