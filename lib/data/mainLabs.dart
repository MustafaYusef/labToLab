// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MainLabsModel mainLabsModelFromJson(String str) =>
    MainLabsModel.fromJson(json.decode(str));

class MainLabsModel {
  MainLabsModel({
    required this.labs,
    required this.status,
  });

  List<MianLab> labs;
  int status;

  factory MainLabsModel.fromJson(Map<String, dynamic> json) => MainLabsModel(
        labs: List<MianLab>.from(json["labs"].map((x) => MianLab.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "labs": List<dynamic>.from(labs.map((x) => x.toJson())),
        "status": status,
      };
}

class MianLab {
  MianLab({
    required this.id,
    required this.name,
    required this.adress,
    required this.image,
    required this.labType,
    required this.lat,
    required this.log,
  });

  int id;
  String name;
  String adress;
  String image;
  String labType;
  String lat;
  String log;

  factory MianLab.fromJson(Map<String, dynamic> json) => MianLab(
        id: json["ID"],
        name: json["Name"],
        adress: json["Adress"],
        image: json["Image"],
        labType: json["LabType"],
        lat: json["Lat"],
        log: json["Log"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Adress": adress,
        "Image": image,
        "LabType": labType,
        "Lat": lat,
        "Log": log,
      };
}
