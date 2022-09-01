// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    required this.role,
    required this.status,
    required this.token,
    required this.LabName,
    required this.userName,
  });

  String role;
  int status;
  String token;
  String LabName;
  String userName;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        role: json["role"],
        status: json["status"],
        token: json["token"],
        LabName: json["LabName"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "status": status,
        "token": token,
        "LabName": LabName,
        "userName": userName,
      };
}
