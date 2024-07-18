
class LoginResponseModel {
  LoginResponseModel({
      this.id, 
      this.username, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.gender, 
      this.image, 
      this.token, 
      this.refreshToken, 
      this.message,});

  LoginResponseModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    message = json['message'];
  }
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? refreshToken;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    map['message'] = message;
    return map;
  }

}