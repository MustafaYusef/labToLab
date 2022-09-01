// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderTenderModel orderTenderModelFromJson(String str) =>
    OrderTenderModel.fromJson(json.decode(str));

class OrderTenderModel {
  OrderTenderModel({
    required this.tenders,
    required this.status,
  });

  List<TenderOrder> tenders;
  int status;

  factory OrderTenderModel.fromJson(Map<String, dynamic> json) =>
      OrderTenderModel(
        tenders: List<TenderOrder>.from(
            json["Tenders"].map((x) => TenderOrder.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Tenders": List<dynamic>.from(tenders.map((x) => x.toJson())),
        "status": status,
      };
}

class TenderOrder {
  TenderOrder({
    required this.id,
    required this.tenderName,
    required this.checkerType,
    required this.sym,
    required this.price,
  });

  int id;
  String tenderName;
  String checkerType;
  String sym;
  String price;

  factory TenderOrder.fromJson(Map<String, dynamic> json) => TenderOrder(
        id: json["ID"],
        tenderName: json["TenderName"],
        checkerType: json["CheckerType"],
        sym: json["Sym"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TenderName": tenderName,
        "CheckerType": checkerType,
        "Sym": sym,
        "Price": price,
      };
}
