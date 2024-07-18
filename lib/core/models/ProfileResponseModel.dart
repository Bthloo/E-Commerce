class ProfileResponseModel {
  ProfileResponseModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.maidenName, 
      this.age, 
      this.gender, 
      this.email, 
      this.phone, 
      this.username, 
      this.password, 
      this.birthDate, 
      this.image, 
      this.bloodGroup, 
      this.height, 
      this.weight, 
      this.eyeColor, 
      this.hair, 
      this.ip, 
      this.address, 
      this.macAddress, 
      this.university, 
      this.bank, 
      this.company, 
      this.ein, 
      this.ssn, 
      this.userAgent, 
      this.crypto, 
      this.role, 
      this.message,});

  ProfileResponseModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? Hair.fromJson(json['hair']) : null;
    ip = json['ip'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = json['crypto'] != null ? Crypto.fromJson(json['crypto']) : null;
    role = json['role'];
    message = json['message'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['maidenName'] = maidenName;
    map['age'] = age;
    map['gender'] = gender;
    map['email'] = email;
    map['phone'] = phone;
    map['username'] = username;
    map['password'] = password;
    map['birthDate'] = birthDate;
    map['image'] = image;
    map['bloodGroup'] = bloodGroup;
    map['height'] = height;
    map['weight'] = weight;
    map['eyeColor'] = eyeColor;
    if (hair != null) {
      map['hair'] = hair?.toJson();
    }
    map['ip'] = ip;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['macAddress'] = macAddress;
    map['university'] = university;
    if (bank != null) {
      map['bank'] = bank?.toJson();
    }
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['ein'] = ein;
    map['ssn'] = ssn;
    map['userAgent'] = userAgent;
    if (crypto != null) {
      map['crypto'] = crypto?.toJson();
    }
    map['role'] = role;
    map['message'] = message;
    return map;
  }

}

class Crypto {
  Crypto({
      this.coin, 
      this.wallet, 
      this.network,});

  Crypto.fromJson(dynamic json) {
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }
  String? coin;
  String? wallet;
  String? network;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coin'] = coin;
    map['wallet'] = wallet;
    map['network'] = network;
    return map;
  }

}

class Company {
  Company({
      this.department, 
      this.name, 
      this.title, 
      this.address,});

  Company.fromJson(dynamic json) {
    department = json['department'];
    name = json['name'];
    title = json['title'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  String? department;
  String? name;
  String? title;
  Address? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['department'] = department;
    map['name'] = name;
    map['title'] = title;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

}

class Address {
  Address({
      this.address, 
      this.city, 
      this.state, 
      this.stateCode, 
      this.postalCode, 
      this.coordinates, 
      this.country,});

  Address.fromJson(dynamic json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    stateCode = json['stateCode'];
    postalCode = json['postalCode'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    country = json['country'];
  }
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['stateCode'] = stateCode;
    map['postalCode'] = postalCode;
    if (coordinates != null) {
      map['coordinates'] = coordinates?.toJson();
    }
    map['country'] = country;
    return map;
  }

}

class Coordinates {
  Coordinates({
      this.lat, 
      this.lng,});

  Coordinates.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Bank {
  Bank({
      this.cardExpire, 
      this.cardNumber, 
      this.cardType, 
      this.currency, 
      this.iban,});

  Bank.fromJson(dynamic json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardExpire'] = cardExpire;
    map['cardNumber'] = cardNumber;
    map['cardType'] = cardType;
    map['currency'] = currency;
    map['iban'] = iban;
    return map;
  }

}

class Hair {
  Hair({
      this.color, 
      this.type,});

  Hair.fromJson(dynamic json) {
    color = json['color'];
    type = json['type'];
  }
  String? color;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['type'] = type;
    return map;
  }

}