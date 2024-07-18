

import 'package:b_commerce/core/models/cart_model.dart';
import 'package:b_commerce/core/models/profile_response_model.dart';
import 'package:b_commerce/features/login_screen/viewmodel/login_cubit.dart';
import 'package:dio/dio.dart';
import '../models/login_response_model.dart';
import '../models/products_from_category_model.dart';


class ApiManager{
 //static String baseUrl = 'http://localhost:3000';
  static String baseUrl = 'https://dummyjson.com';
 static Dio dio = Dio();

//
//  static Future<RegisterResponseModel> register({
//     required String username,
//     required String email,
//     required String password,
// })async{
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var data = json.encode({
//       "username": username,
//       "email": email,
//       "password": password
//     });
//
//     var request = await dio.request(
//       '$baseUrl/auth/register',
//       options: Options(
//         method: 'POST',
//         headers: headers,
//       ),
//       data: data,
//     );
//     RegisterResponseModel response = RegisterResponseModel.fromJson(request.data);
//
//     debugPrint(response.toJson().toString());
//     return response;
//   }
//
//  static Future<LoginResponseModel> login({
//    required String email,
//    required String password,
//  })async{
//    var headers = {
//      'Content-Type': 'application/json'
//    };
//    var data = json.encode({
//      "email": email,
//      "password": password
//    });
//    var request = await dio.request(
//      '$baseUrl/auth/login',
//      options: Options(
//        method: 'POST',
//        headers: headers,
//      ),
//      data: data,
//    );
//    LoginResponseModel response = LoginResponseModel.fromJson(request.data);
//
//    debugPrint(response.toJson().toString());
//    return response;
//  }
//
//
//  static Future<AllCategoriesModel> getAllCategories()async{
//    var headers = {
//      'Content-Type': 'application/json'
//    };
//    var request = await dio.request(
//      '$baseUrl/categories',
//      options: Options(
//        method: 'GET',
//        headers: headers,
//      ),
//    );
//    AllCategoriesModel response = AllCategoriesModel.fromJson(request.data);
//
//    debugPrint(response.toJson().toString());
//    return response;
//  }
//  static Future<ProductFromCategoryModel> getProductsFromCategory(num id)async{
//    var headers = {
//      'Content-Type': 'application/json'
//    };
//    var request = await dio.get(
//      '$baseUrl/products',
//       queryParameters: {
//         'categoryId': id
//       },
//    );
//    ProductFromCategoryModel response = ProductFromCategoryModel.fromJson(request.data);
//
//    debugPrint(response.toJson().toString());
//    return response;
//  }


  static Future<LoginResponseModel>login({required String username, required String password})async{
    var response = await dio.post(
        '$baseUrl/user/login',
        options: Options(
            headers: {
              'Content-Type': 'application/json'
            }
        ),
        data: {
          "username" : username,
          "password" : password
        }
    );
    LoginResponseModel responseModel = LoginResponseModel.fromJson(response.data);
    return responseModel;
  }


  static Future<ProfileResponseModel>getUserProfile({required int id})async{
    var response = await dio.get(
      '$baseUrl/users/$id',
    );

    ProfileResponseModel responseModel = ProfileResponseModel.fromJson(response.data);

    return responseModel;
  }
  static Future<CartModel>getCart()async{
    var response = await dio.get(
      '$baseUrl/carts/user/${LoginCubit.currentUserId}',
    );

    CartModel responseModel = CartModel.fromJson(response.data);

    return responseModel;
  }


  static Future<ProductsFromCategoryModel>searchProducts({required String query})async{
    var response = await dio.get(
      '$baseUrl/products/search',
      queryParameters: {
        "q" : query
      }
    );
ProductsFromCategoryModel responseModel = ProductsFromCategoryModel.fromJson(response.data);
    return responseModel;
  }

 static Future<List<dynamic>>getCategories()async{
   var response = await dio.get(
     '$baseUrl/products/categories',
   );

   return response.data;
 }

 static Future<ProductsFromCategoryModel>getProductsFromCategory(String categoryId)async{
   var request = await dio.get(
     '$baseUrl/products/category/$categoryId',
   );
   ProductsFromCategoryModel response = ProductsFromCategoryModel.fromJson(request.data);

   return response;
 }


  static Future<ProductsFromCategoryModel>getAllProducts()async{
    var request = await dio.get(
      '$baseUrl/products',
    );
    ProductsFromCategoryModel response = ProductsFromCategoryModel.fromJson(request.data);

    return response;
  }

}