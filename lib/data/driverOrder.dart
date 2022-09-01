// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DriverOrderModel driverOrderModelFromJson(String str) =>
    DriverOrderModel.fromJson(json.decode(str));

class DriverOrderModel {
  DriverOrderModel({
    required this.order,
    required this.error,
    required this.status,
  });

  List<DriverOrder> order;
  dynamic error;
  int status;

  factory DriverOrderModel.fromJson(Map<String, dynamic> json) =>
      DriverOrderModel(
        order: List<DriverOrder>.from(
            json["Order"].map((x) => DriverOrder.fromJson(x))),
        error: json["error"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Order": List<dynamic>.from(order.map((x) => x.toJson())),
        "error": error,
        "status": status,
      };
}

class DriverOrder {
  DriverOrder(
      {required this.id,
      required this.secLab,
      required this.mainLab,
      required this.secLat,
      required this.mainLog,
      required this.secLog,
      required this.mainLat,
      required this.orderStatus,
      required this.orderStatusCode,
      required this.createdAt,
      required this.price,
      required this.driverMan,
      required this.patientName,
      required this.patientAge,
      required this.patientCode,
      required this.patientTestResult,
      required this.timeToResponse,
      required this.requestType,
      required this.orderStatusColorCode});

  int id;
  String secLab;
  String mainLab;
  String secLat;
  String mainLog;
  String secLog;
  String mainLat;
  String orderStatus;
  String orderStatusCode;
  DateTime createdAt;
  String price;
  String driverMan;
  String patientName;
  String patientAge;
  String patientCode;
  String patientTestResult;
  String timeToResponse;
  String requestType;
  String orderStatusColorCode;

  factory DriverOrder.fromJson(Map<String, dynamic> json) => DriverOrder(
      id: json["ID"],
      secLab: json["SecLab"],
      mainLab: json["MainLab"],
      secLat: json["SecLat"],
      mainLog: json["MainLog"],
      secLog: json["SecLog"],
      mainLat: json["MainLat"],
      orderStatus: json["OrderStatus"],
      orderStatusCode: json["OrderStatusCode"],
      createdAt: DateTime.parse(json["CreatedAt"]),
      price: json["Price"],
      driverMan: json["DriverMan"],
      patientName: json["PatientName"],
      patientAge: json["PatientAge"],
      patientCode: json["PatientCode"],
      patientTestResult: json["PatientTestResult"],
      timeToResponse: json["TimeToResponse"],
      requestType: json["RequestType"],
      orderStatusColorCode: json["OrderStatusColorCode"]);

  Map<String, dynamic> toJson() => {
        "ID": id,
        "SecLab": secLab,
        "MainLab": mainLab,
        "SecLat": secLat,
        "MainLog": mainLog,
        "SecLog": secLog,
        "MainLat": mainLat,
        "OrderStatus": orderStatus,
        "OrderStatusCode": orderStatusCode,
        "CreatedAt": createdAt.toIso8601String(),
        "Price": price,
        "DriverMan": driverMan,
        "PatientName": patientName,
        "PatientAge": patientAge,
        "PatientCode": patientCode,
        "PatientTestResult": patientTestResult,
        "TimeToResponse": timeToResponse,
        "RequestType": requestType,
        "OrderStatusColorCode": orderStatusColorCode
      };
}
