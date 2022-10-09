class LoginSuccessModel {
  Message? message;

  LoginSuccessModel({this.message});

  LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? token;
  User? user;

  Message({this.token, this.user});

  Message.fromJson(Map<String, dynamic> json) {
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
  String? balance;
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

class LoginErrorModel {
  String? message;
  Errors? errors;

  LoginErrorModel({this.message, this.errors});

  LoginErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  String? data;

  Errors({this.data});

  Errors.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}