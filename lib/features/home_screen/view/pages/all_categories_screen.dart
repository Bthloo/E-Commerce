import 'dart:ui';

import 'package:b_commerce/features/home_screen/view/component/custom_category_item.dart';
import 'package:b_commerce/features/product_from_category_screen/view/pages/products_from_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/categories_model.dart';
import '../component/categories_wedgit.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});
static const String routeName = 'AllCategoriesScreen';
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> args = ModalRoute.of(context)!.settings.arguments as List<CategoryModel>;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.transparent)),
        ),
        title: const Text('All Categories'),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: args.map((e) => SizedBox(
             width: 180.w,
              child: CustomCategoryItem(title: e.name!, onTap: () {
                Navigator.of(context).pushNamed(
                    ProductsFromCategoryScreen.routeName,
                    arguments: ProductsFromCategoryArgument(
                  name: e.name!,
                  id: e.slug!,
                ));
              }),
            )).toList(),
          ),
        ),]
      ),
    );
  }
}
