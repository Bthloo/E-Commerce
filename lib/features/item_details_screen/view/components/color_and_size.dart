import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:  Colors.grey.shade200,
          ),
          child:  DropdownMenu(
              label:  Text(
                "Color",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                ),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                    value: "Red",
                    label: 'Red',
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Colors.grey.withOpacity(.5)
                      ),
                      // foregroundColor: const WidgetStatePropertyAll(
                      //     AppTheme.whiteColor
                      // )
                    )
                ),
                DropdownMenuEntry(

                    value: "Black",
                    label: 'Black',
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Colors.grey.withOpacity(.5)
                      ),

                    )
                ),
                DropdownMenuEntry(
                    value: "White",
                    label: 'White',
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Colors.grey.withOpacity(.5)
                      ),

                    )
                )
              ]
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color:  Colors.grey,
          ),
          child: DropdownMenu(

              label:   Text(
                "Size",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                ),
              ),
              dropdownMenuEntries:const [
                DropdownMenuEntry(
                    value: "Small",
                    label: 'Small'
                ),
                DropdownMenuEntry(
                    value: "Medium",
                    label: 'Medium'
                ),
                DropdownMenuEntry(
                    value: "Large",
                    label: 'Large'
                )
              ]
          ),
        ),
      ],
    );
  }
}
