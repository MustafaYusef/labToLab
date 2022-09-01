// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TermsModel termsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

class TermsModel {
  TermsModel({
    required this.systems,
    required this.status,
  });

  List<System> systems;
  int status;

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        systems:
            List<System>.from(json["Systems"].map((x) => System.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Systems": List<dynamic>.from(systems.map((x) => x.toJson())),
        "status": status,
      };
}

class System {
  System({
    required this.about,
    required this.term,
  });

  String about;
  String term;

  factory System.fromJson(Map<String, dynamic> json) => System(
        about: json["About"],
        term: json["Term"],
      );

  Map<String, dynamic> toJson() => {
        "About": about,
        "Term": term,
      };
}
