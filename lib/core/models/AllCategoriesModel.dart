/// success : true
/// message : "Fetched categories successfully"
/// data : {"categories":[{"id":1,"name":"Home Decor","imageUrl":"https://cdn.shopify.com/s/files/1/0261/6833/files getCategoryImage_health-wellness.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-05-17T16:42:22.000Z"},{"id":2,"name":"Grocery","imageUrl":"https://cdn.example.com/category-images/women-fashion.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-01-01T12:04:05.000Z"},{"id":3,"name":"Baby Products","imageUrl":"https://cdn.example.com/category-images/women-clothing.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-04-12T15:47:49.000Z"},{"id":4,"name":"Baby Clothing","imageUrl":"https://cdn.example.com/category-images/women-fashion.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-04-04T15:15:46.000Z"},{"id":5,"name":"Home and Kitchen","imageUrl":"https://cdn.example.com/category-images/pet-supplies.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-06-10T06:05:52.000Z"},{"id":6,"name":"Computer and Accessories","imageUrl":"https://i.ibb.co/f1f1f1f1f1f1f1/category-thumbnail.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-09-17T08:44:51.000Z"},{"id":7,"name":"Outdoor Furniture","imageUrl":"https://i.ibb.co/f1f1f1f1f1f1f1/category-thumbnail.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-02-22T01:37:29.000Z"},{"id":8,"name":"Mens Fashion","imageUrl":"https://cdn.shopify.com/s/files/1/0261/6833/files getCategoryImage_home-decor.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-11-27T22:15:20.000Z"},{"id":9,"name":"Gourmet Food","imageUrl":"https://cdn.pixabay.com/photo/2017/07/21/14/47/men-fashion-2520777_1280.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-07-11T06:54:04.000Z"},{"id":10,"name":"Womens Fashion","imageUrl":"https://cdn.pixabay.com/photo/2017/07/21/14/47/electronics-2520777_1280.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-01-13T12:40:18.000Z"}]}

class AllCategoriesModel {
  AllCategoriesModel({
      this.success, 
      this.message, 
      this.data,});

  AllCategoriesModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// categories : [{"id":1,"name":"Home Decor","imageUrl":"https://cdn.shopify.com/s/files/1/0261/6833/files getCategoryImage_health-wellness.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-05-17T16:42:22.000Z"},{"id":2,"name":"Grocery","imageUrl":"https://cdn.example.com/category-images/women-fashion.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-01-01T12:04:05.000Z"},{"id":3,"name":"Baby Products","imageUrl":"https://cdn.example.com/category-images/women-clothing.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-04-12T15:47:49.000Z"},{"id":4,"name":"Baby Clothing","imageUrl":"https://cdn.example.com/category-images/women-fashion.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-04-04T15:15:46.000Z"},{"id":5,"name":"Home and Kitchen","imageUrl":"https://cdn.example.com/category-images/pet-supplies.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-06-10T06:05:52.000Z"},{"id":6,"name":"Computer and Accessories","imageUrl":"https://i.ibb.co/f1f1f1f1f1f1f1/category-thumbnail.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-09-17T08:44:51.000Z"},{"id":7,"name":"Outdoor Furniture","imageUrl":"https://i.ibb.co/f1f1f1f1f1f1f1/category-thumbnail.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-02-22T01:37:29.000Z"},{"id":8,"name":"Mens Fashion","imageUrl":"https://cdn.shopify.com/s/files/1/0261/6833/files getCategoryImage_home-decor.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-11-27T22:15:20.000Z"},{"id":9,"name":"Gourmet Food","imageUrl":"https://cdn.pixabay.com/photo/2017/07/21/14/47/men-fashion-2520777_1280.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-07-11T06:54:04.000Z"},{"id":10,"name":"Womens Fashion","imageUrl":"https://cdn.pixabay.com/photo/2017/07/21/14/47/electronics-2520777_1280.jpg","createdAt":"2024-06-23T11:17:50.211Z","updatedAt":"2020-01-13T12:40:18.000Z"}]

class Data {
  Data({
      this.categories,});

  Data.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Home Decor"
/// imageUrl : "https://cdn.shopify.com/s/files/1/0261/6833/files getCategoryImage_health-wellness.jpg"
/// createdAt : "2024-06-23T11:17:50.211Z"
/// updatedAt : "2020-05-17T16:42:22.000Z"

class Categories {
  Categories({
      this.id, 
      this.name, 
      this.imageUrl, 
      this.createdAt, 
      this.updatedAt,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}