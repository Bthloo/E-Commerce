import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/custom_expansion_tile.dart';

class DescriptionExpansionTile extends StatelessWidget {
  const DescriptionExpansionTile({super.key,required this.description});
final String? description;
  @override
  Widget build(BuildContext context) {
    return  CustomExpansionTile(
      title:   "Description",
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 15.0.w,
              vertical: 15.0.h
          ),
          child: Text(
            description ?? "No Description",
            style:Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,

            ),
          ),
        ),
      ],
    );
  }
}
