// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ContactsModel contactsModelFromJson(String str) =>
    ContactsModel.fromJson(json.decode(str));

class ContactsModel {
  ContactsModel({
    required this.mainPhoneCall,
    required this.secondPhoneCall,
    required this.status,
    required this.website,
  });

  String mainPhoneCall;
  String secondPhoneCall;
  int status;
  String website;

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
        mainPhoneCall: json["MainPhoneCall"],
        secondPhoneCall: json["SecondPhoneCall"],
        status: json["status"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "MainPhoneCall": mainPhoneCall,
        "SecondPhoneCall": secondPhoneCall,
        "status": status,
        "website": website,
      };
}
