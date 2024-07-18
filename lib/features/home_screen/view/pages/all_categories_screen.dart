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
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: SingleChildScrollView(

        child: Center(
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
        ),
      ),
    );
  }
}
