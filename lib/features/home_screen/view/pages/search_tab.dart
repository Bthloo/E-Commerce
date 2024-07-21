import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/search_bar.dart';

class SearchTab extends StatelessWidget {
   const SearchTab({super.key,});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
           Row(
             children: [
               Expanded(
                 child:InkWell(
                   borderRadius: BorderRadius.circular(100.r),
                   onTap: () {
                     showSearch(context: context, delegate: ProductSearch(context),);

                   },
                   child: Card(

                       elevation: 2,
                       color: Theme.of(context).colorScheme.inversePrimary,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(100.r),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(
                           horizontal: 20,
                           vertical: 15,
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Icon(Icons.search,
                               color: Theme.of(context).colorScheme.onPrimary
                               ,),
                             SizedBox(width: 10.w,),
                             Text(
                               "Search",
                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 fontSize: 18,
                                 color: Theme.of(context).colorScheme.onPrimary,
                                 //fontWeight: FontWeight.w600,
                               ),
                             ),
                           ],
                         ),
                       )
                   ),
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
