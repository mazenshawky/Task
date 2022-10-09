class RegisterModel {
  String? message;
  Data? data;

  RegisterModel({this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  Null? balance;
  String? birthDate;
  String? email;
  String? phoneNumber;
  String? gender;
  String? profession;
  String? joinedDate;

  User(
      {this.firstName,
        this.lastName,
        this.balance,
        this.birthDate,
        this.email,
        this.phoneNumber,
        this.gender,
        this.profession,
        this.joinedDate});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    balance = json['balance'];
    birthDate = json['birth_date'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    profession = json['profession'];
    joinedDate = json['joined_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['balance'] = this.balance;
    data['birth_date'] = this.birthDate;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['profession'] = this.profession;
    data['joined_date'] = this.joinedDate;
    return data;
  }
}