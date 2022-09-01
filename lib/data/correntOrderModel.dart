// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurrentOrderModel currentOrderModelFromJson(String str) =>
    CurrentOrderModel.fromJson(json.decode(str));

class CurrentOrderModel {
  CurrentOrderModel({
    required this.order,
    required this.status,
  });

  List<Order> order;
  int status;

  factory CurrentOrderModel.fromJson(Map<String, dynamic> json) =>
      CurrentOrderModel(
        order: List<Order>.from(json["Order"].map((x) => Order.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Order": List<dynamic>.from(order.map((x) => x.toJson())),
        "status": status,
      };
}

class Order {
  Order(
      {required this.id,
      required this.mainLab,
      required this.orderStatus,
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
  String mainLab;
  String orderStatus;
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

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: json["ID"],
      mainLab: json["MainLab"],
      orderStatus: json["OrderStatus"],
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
        "MainLab": mainLab,
        "OrderStatus": orderStatus,
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
