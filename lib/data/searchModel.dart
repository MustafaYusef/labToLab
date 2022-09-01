// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PublicSearchModel publicSearchModelFromJson(String str) =>
    PublicSearchModel.fromJson(json.decode(str));

class PublicSearchModel {
  PublicSearchModel({
    required this.tender,
    required this.status,
  });

  List<SerchTender> tender;
  int status;

  factory PublicSearchModel.fromJson(Map<String, dynamic> json) =>
      PublicSearchModel(
        tender: List<SerchTender>.from(
            json["Tender"].map((x) => SerchTender.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Tender": List<dynamic>.from(tender.map((x) => x.toJson())),
        "status": status,
      };
}

class SerchTender {
  SerchTender({
    required this.tenderId,
    required this.tanderName,
    required this.checkerType,
    required this.sym,
    required this.price,
    required this.labName,
    required this.labAddress,
    required this.image,
    required this.labId,
    required this.lat,
    required this.log,
  });

  int tenderId;
  String tanderName;
  String checkerType;
  String sym;
  String price;
  String labName;
  String labAddress;
  String image;
  int labId;
  String lat;
  String log;

  factory SerchTender.fromJson(Map<String, dynamic> json) => SerchTender(
        tenderId: json["TenderId"],
        tanderName: json["TanderName"],
        checkerType: json["CheckerType"],
        sym: json["Sym"],
        price: json["Price"],
        labName: json["LabName"],
        labAddress: json["LabAddress"],
        image: json["Image"],
        labId: json["LabId"],
        lat: json["Lat"],
        log: json["Log"],
      );

  Map<String, dynamic> toJson() => {
        "TenderId": tenderId,
        "TanderName": tanderName,
        "CheckerType": checkerType,
        "Sym": sym,
        "Price": price,
        "LabName": labName,
        "LabAddress": labAddress,
        "Image": image,
        "LabId": labId,
        "Lat": lat,
        "Log": log,
      };
}
