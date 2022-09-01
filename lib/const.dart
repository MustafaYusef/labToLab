import 'package:flutter/material.dart';
import 'package:get/get.dart';

const baseUrl = "https://labmirsal.herokuapp.com/api/";
// const imageUrl = "https://labmirsal.herokuapp.com/uploads/";
var myGrey = Colors.grey[50];
var list = [
  {"image": "assets/images/labToLab1.jpeg", "name": "البقالة"},
  {"image": "assets/images/labToLab2.jpeg", "name": "سوبر ماركت"},
  {"image": "assets/images/labToLab3.jpeg", "name": "المتاجر الجديدة"},
  {"image": "assets/images/labToLab1.jpeg", "name": "بطاقات شحن"},
  {"image": "assets/images/labToLab2.jpeg", "name": "اسواق الجملة"}
];
const noNet = "لا يوجد أتصال بالشبكة";
var textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);
var textFieldStyleRed = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Get.theme.primaryColor,
    width: 1,
  ),
);
var textFieldStyleBlack = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);
