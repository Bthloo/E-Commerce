
import 'package:b_commerce/features/login_screen/domain/entities/user_entitiy.dart';

class LoginResponseModel extends UserEntity {
  LoginResponseModel({
      this.username,
      this.gender, 
      this.image,
      this.refreshToken, 
      this.message,
    required super.email,
    required super.name,
    required super.token,
    required super.id,});

  LoginResponseModel.fromJson(dynamic json)
      : super(
      email: json['email'], name: json['firstName']+ " " + json['lastName'], id: json['id'], token: json['token']
  ) {
    username = json['username'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    message = json['message'];
  }
  String? username;
  String? gender;
  String? image;
  String? refreshToken;
  String? message;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['username'] = username;
  //   map['email'] = email;
  //  // map['firstName'] = firstName;
  //   //map['lastName'] = lastName;
  //   map['gender'] = gender;
  //   map['image'] = image;
  //   map['token'] = token;
  //   map['refreshToken'] = refreshToken;
  //   map['message'] = message;
  //   return map;
  // }

}