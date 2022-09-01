// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MianLabOrderModel mianLabOrderModelFromJson(String str) =>
    MianLabOrderModel.fromJson(json.decode(str));

class MianLabOrderModel {
  MianLabOrderModel({
    required this.order,
    required this.status,
  });

  List<MainLabOrder> order;
  int status;

  factory MianLabOrderModel.fromJson(Map<String, dynamic> json) =>
      MianLabOrderModel(
        order: List<MainLabOrder>.from(
            json["Order"].map((x) => MainLabOrder.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Order": List<dynamic>.from(order.map((x) => x.toJson())),
        "status": status,
      };
}

class MainLabOrder {
  MainLabOrder(
      {required this.id,
      required this.secLab,
      required this.orderStatus,
      required this.createdAt,
      required this.price,
      required this.driverMan,
      required this.patientName,
      required this.patientAge,
      required this.patientCode,
      required this.patientTestResult,
      required this.timeToResponse,
      required this.requestType});

  int id;
  String secLab;
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

  factory MainLabOrder.fromJson(Map<String, dynamic> json) => MainLabOrder(
        id: json["ID"],
        secLab: json["SecLab"],
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
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "SecLab": secLab,
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
      };
}
