import 'dart:convert';

import 'package:b_commerce/core/models/products_from_category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/AllCategoriesModel.dart';
import '../models/login_response_model.dart';
import '../models/register_response_model.dart';


class ApiManager{
 static String baseUrl = 'http://localhost:3000';
 static Dio dio = Dio();
 static Future<RegisterResponseModel> register({
    required String username,
    required String email,
    required String password,
})async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "username": username,
      "email": email,
      "password": password
    });

    var request = await dio.request(
      '$baseUrl/auth/register',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    RegisterResponseModel response = RegisterResponseModel.fromJson(request.data);

    debugPrint(response.toJson().toString());
    return response;
  }

 static Future<LoginResponseModel> login({
   required String email,
   required String password,
 })async{
   var headers = {
     'Content-Type': 'application/json'
   };
   var data = json.encode({
     "email": email,
     "password": password
   });
   var request = await dio.request(
     '$baseUrl/auth/login',
     options: Options(
       method: 'POST',
       headers: headers,
     ),
     data: data,
   );
   LoginResponseModel response = LoginResponseModel.fromJson(request.data);

   debugPrint(response.toJson().toString());
   return response;
 }


 static Future<AllCategoriesModel> getAllCategories()async{
   var headers = {
     'Content-Type': 'application/json'
   };
   var request = await dio.request(
     '$baseUrl/categories',
     options: Options(
       method: 'GET',
       headers: headers,
     ),
   );
   AllCategoriesModel response = AllCategoriesModel.fromJson(request.data);

   debugPrint(response.toJson().toString());
   return response;
 }
 static Future<ProductFromCategoryModel> getProductsFromCategory(num id)async{
   var headers = {
     'Content-Type': 'application/json'
   };
   var request = await dio.get(
     '$baseUrl/products',
      queryParameters: {
        'categoryId': id
      },
   );
   ProductFromCategoryModel response = ProductFromCategoryModel.fromJson(request.data);

   debugPrint(response.toJson().toString());
   return response;
 }

}