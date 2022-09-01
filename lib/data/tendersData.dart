// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TendersModel tendersModelFromJson(String str) =>
    TendersModel.fromJson(json.decode(str));

class TendersModel {
  TendersModel({
    required this.tenders,
    required this.status,
  });

  List<Tender> tenders;
  int status;

  factory TendersModel.fromJson(Map<String, dynamic> json) => TendersModel(
        tenders:
            List<Tender>.from(json["Tenders"].map((x) => Tender.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Tenders": List<dynamic>.from(tenders.map((x) => x.toJson())),
        "status": status,
      };
}

class Tender {
  Tender({
    required this.id,
    required this.tanderName,
    required this.checkerType,
    required this.sym,
    required this.price,
    required this.labId,
  });

  int id;
  String tanderName;
  String checkerType;
  String sym;
  String price;
  String labId;

  factory Tender.fromJson(Map<String, dynamic> json) => Tender(
        id: json["ID"],
        tanderName: json["TanderName"],
        checkerType: json["CheckerType"],
        sym: json["Sym"],
        price: json["Price"],
        labId: json["LabId"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TanderName": tanderName,
        "CheckerType": checkerType,
        "Sym": sym,
        "Price": price,
        "LabId": labId,
      };
}
