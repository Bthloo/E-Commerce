import 'package:flutter/material.dart';

import '../../../../core/general_components/custom_expansion_tile.dart';
import '../../../../core/models/ProductsFromCategoryModel.dart';

class ProductDetailExpansionTile extends StatelessWidget {
  const ProductDetailExpansionTile({super.key,required this.args});
final Products args;
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
        title: "Product Details",
        children:[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Brand Name: ${args.brand ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Category: ${args.category ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Tags: ${args.tags?.join(" - ") ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Availability: ${args.availabilityStatus ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Warranty: ${args.warrantyInformation ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Weight: ${args.weight ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Height: ${args.dimensions?.height ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Width: ${args.dimensions?.width ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Depth: ${args.dimensions?.depth ?? "Unknown"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
                      ),
            ),
          )]
    );
  }
}
