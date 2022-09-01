// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LabInfoModel labInfoModelFromJson(String str) =>
    LabInfoModel.fromJson(json.decode(str));

class LabInfoModel {
  LabInfoModel({
    required this.informations,
    required this.status,
  });

  List<Information> informations;
  int status;

  factory LabInfoModel.fromJson(Map<String, dynamic> json) => LabInfoModel(
        informations: List<Information>.from(
            json["Informations"].map((x) => Information.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Informations": List<dynamic>.from(informations.map((x) => x.toJson())),
        "status": status,
      };
}

class Information {
  Information({
    required this.id,
    required this.title,
    required this.description,
  });

  int id;
  String title;
  String description;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["ID"],
        title: json["Title"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Title": title,
        "Description": description,
      };
}
