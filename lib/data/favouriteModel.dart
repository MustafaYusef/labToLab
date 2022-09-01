// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FavouriteModel favouriteModelFromJson(String str) =>
    FavouriteModel.fromJson(json.decode(str));

class FavouriteModel {
  FavouriteModel({
    required this.labs,
    required this.status,
  });

  List<FavouriteLab> labs;
  int status;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        labs: List<FavouriteLab>.from(
            json["labs"].map((x) => FavouriteLab.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "labs": List<dynamic>.from(labs.map((x) => x.toJson())),
        "status": status,
      };
}

class FavouriteLab {
  FavouriteLab({
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

  factory FavouriteLab.fromJson(Map<String, dynamic> json) => FavouriteLab(
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
