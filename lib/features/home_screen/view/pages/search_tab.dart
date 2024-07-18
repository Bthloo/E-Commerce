import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/search_bar.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
           Row(
             children: [
               Expanded(
                 child: SearchBar(
                   elevation: const WidgetStatePropertyAll(
                        2
                   ),
                   backgroundColor: WidgetStatePropertyAll(
                       Theme.of(context).colorScheme.inversePrimary
                   ),
                   leading:  Icon(Icons.search,
                     color: Theme.of(context).colorScheme.onPrimary
                     ,),
                  hintText: 'Search',
                  hintStyle: WidgetStatePropertyAll(
                    TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                  ),
                  side:  WidgetStatePropertyAll(
                  BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 1,

                  )
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: ProductSearch(),);

                  },
                           ),
               ),
               SizedBox(width: 30.w,),
               IconButton.outlined(
                 style: ButtonStyle(
                   elevation: WidgetStateProperty.all(3),
                   shadowColor: WidgetStateProperty.all(Theme.of(context).colorScheme.inversePrimary),
                   side: WidgetStateProperty.all(BorderSide(
                     color: Theme.of(context).colorScheme.inversePrimary,
                     width: 0,
                   )),
                   shape: WidgetStateProperty.all(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   )),
                   backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.inversePrimary),
                 ),
                   onPressed: () {

                   },
                   icon: Icon(Icons.tune,
                     size: 35.r,
                     color: Theme.of(context).colorScheme.onPrimary,
                   ),
               )

             ],
           ),

        ]
      ),
    );
  }

}
