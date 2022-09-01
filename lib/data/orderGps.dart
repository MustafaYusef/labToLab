// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderGpsModel orderGpsModelFromJson(String str) =>
    OrderGpsModel.fromJson(json.decode(str));

class OrderGpsModel {
  OrderGpsModel({
    required this.order,
    required this.error,
    required this.status,
  });

  OrderGps order;
  dynamic error;
  int status;

  factory OrderGpsModel.fromJson(Map<String, dynamic> json) => OrderGpsModel(
        order: OrderGps.fromJson(json["Order"]),
        error: json["error"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "error": error,
        "status": status,
      };
}

class OrderGps {
  OrderGps({
    required this.id,
    required this.orderId,
    required this.lat,
    required this.log,
    required this.userId,
  });

  int id;
  int orderId;
  String lat;
  String log;
  int userId;

  factory OrderGps.fromJson(Map<String, dynamic> json) => OrderGps(
        id: json["Id"],
        orderId: json["OrderId"],
        lat: json["Lat"],
        log: json["Log"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "OrderId": orderId,
        "Lat": lat,
        "Log": log,
        "UserId": userId,
      };
}
