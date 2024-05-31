import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/home_tab.dart';
import 'category_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: GridView.builder(
        itemCount: categoryItems.length,

        itemBuilder: (context, index) {
          return CategoryItem(
              onTap: () {
                if(selectedIndex == index) {
                  return;
                }else {
                  setState(() {
                  selectedIndex = index;
                  for (var element in categoryItems) {
                    element.isSelected = false;
                  }
                  categoryItems[index].isSelected = true;
                });
                  debugPrint("Selected Index: $selectedIndex");
                }

              },
              title: categoryItems[index].title,
              icon: categoryItems[index].icon,
              isSelected: categoryItems[index].isSelected,
              index: index
          );
        },
        addSemanticIndexes: true,

        scrollDirection: Axis.horizontal,


        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //crossAxisSpacing: 10.0,
            mainAxisSpacing: 0,
          childAspectRatio: 1.13,


        ),
      ),
    );
  }
}
