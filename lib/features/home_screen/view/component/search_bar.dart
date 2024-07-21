import 'package:b_commerce/features/home_screen/view/component/search_item.dart';
import 'package:b_commerce/features/home_screen/viewmodel/search_viewmodel/search_cubit.dart';
import 'package:b_commerce/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSearch extends SearchDelegate {
  //BuildContext context;
  ProductSearch(BuildContext context) : super(
    searchFieldLabel: "Search",
    keyboardType: TextInputType.text,
    searchFieldStyle:  TextStyle(
     color: Theme.of(context).colorScheme.onPrimary,
      fontSize: 18,
    ),

    textInputAction: TextInputAction.search,
  );


SearchCubit searchCubit = SearchCubit();
@override
  get searchFieldLabel => query;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        showResults(context);
      },
          icon: const Icon(Icons.search))
    ];
  }




  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.clear)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: BlocProvider(
        create: (context) => SearchCubit()..search(query),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if(state is SearchLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is SearchSuccess){
              if (state.searchResults.isEmpty) {
                return const Center(child: Text('No Data Found'));
              }else{
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchItem(
                        onTap: (){
                          Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                              arguments: state.searchResults[index]);
                        },
                        price: state.searchResults[index].price?? 0,
                        discountPercentage: state.searchResults[index].discountPercentage?? 0,
                        thumbnail: state.searchResults[index].thumbnail?? "no image",
                        title: state.searchResults[index].title?? "No Title",
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.searchResults.length
                );
              }

            }else if(state is SearchFailure){
              return Center(
                child: Column(
                  children: [
                    Text(state.error.toString()),
                    ElevatedButton(
                        onPressed: (){
                          showResults(context);
                        },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }else {
              return const Center(child: Text('No Data Found'));
            }

          },
        ),
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //return Text('');
    searchCubit.search(query);
    if (query.isEmpty) {
      return const Center(child: Text('Please Enter Search Word'));
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: BlocBuilder<SearchCubit, SearchState>(
            bloc: searchCubit,
            builder: (context, state) {
              if(state is SearchLoading){
                return const Center(child: CircularProgressIndicator());
              }else if(state is SearchSuccess){
                if (state.searchResults.isEmpty || state.searchResults == []) {
                  return const Center(child: Text('No Data Found'));
                }else{
                  return ListView.separated(
                      itemBuilder: (context, index) {
                          return SearchItem(
                            onTap: (){
                              Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                                  arguments: state.searchResults[index]);
                            },
                            price: state.searchResults[index].price?? 0,
                            discountPercentage: state.searchResults[index].discountPercentage?? 0,
                            thumbnail: state.searchResults[index].thumbnail?? "no image",
                            title: state.searchResults[index].title?? "No Title",
                          );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.searchResults.length
                  );
                }

              }else if(state is SearchFailure){
                return Center(
                  child: Column(
                    children: [
                      Text(state.error.toString()),
                      ElevatedButton(
                          onPressed: (){
                            showResults(context);
                          },
                          child: const Text('Try Again'))
                    ],
                  ),
                );
              }else {
                return const Center(child: Text('No Data Found'));
              }

            },
          ),
        ),
      );
    }
  }


}