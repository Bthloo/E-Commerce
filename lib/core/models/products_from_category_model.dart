/// success : true
/// message : "Fetched products"
/// data : {"products":[{"name":"Prod1","price":33,"imageUrl":"http://localhost:3000","category":"Home Decor","discountedPrice":-335.65691601119966,"quantity":5}]}
/// pagination : {"page":1,"perPage":10,"total":1,"hasNextPage":false,"hasPreviousPage":false}

class ProductFromCategoryModel {
  ProductFromCategoryModel({
      this.success, 
      this.message, 
      this.data,
      this.pagination,});

  ProductFromCategoryModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  bool? success;
  String? message;
  Data? data;
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }

}

/// page : 1
/// perPage : 10
/// total : 1
/// hasNextPage : false
/// hasPreviousPage : false

class Pagination {
  Pagination({
      this.page, 
      this.perPage, 
      this.total, 
      this.hasNextPage, 
      this.hasPreviousPage,});

  Pagination.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['perPage'];
    total = json['total'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }
  num? page;
  num? perPage;
  num? total;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['perPage'] = perPage;
    map['total'] = total;
    map['hasNextPage'] = hasNextPage;
    map['hasPreviousPage'] = hasPreviousPage;
    return map;
  }

}

/// products : [{"name":"Prod1","price":33,"imageUrl":"http://localhost:3000","category":"Home Decor","discountedPrice":-335.65691601119966,"quantity":5}]

class Data {
  Data({
      this.products,});

  Data.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Prod1"
/// price : 33
/// imageUrl : "http://localhost:3000"
/// category : "Home Decor"
/// discountedPrice : -335.65691601119966
/// quantity : 5

class Products {
  Products({
      this.name, 
      this.price, 
      this.imageUrl, 
      this.category, 
      this.discountedPrice, 
      this.quantity,});

  Products.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    category = json['category'];
    discountedPrice = json['discountedPrice'];
    quantity = json['quantity'];
  }
  String? name;
  num? price;
  String? imageUrl;
  String? category;
  num? discountedPrice;
  num? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['imageUrl'] = imageUrl;
    map['category'] = category;
    map['discountedPrice'] = discountedPrice;
    map['quantity'] = quantity;
    return map;
  }

}