// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannersModel bannersModelFromJson(String str) =>
    BannersModel.fromJson(json.decode(str));

class BannersModel {
  BannersModel({
    required this.promotionImages,
    required this.status,
  });

  List<PromotionImage> promotionImages;
  int status;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        promotionImages: List<PromotionImage>.from(
            json["Promotions"].map((x) => PromotionImage.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Promotions":
            List<dynamic>.from(promotionImages.map((x) => x.toJson())),
        "status": status,
      };
}

class PromotionImage {
  PromotionImage({
    required this.image,
    required this.id,
  });

  String image;
  int id;

  factory PromotionImage.fromJson(Map<String, dynamic> json) => PromotionImage(
        image: json["ImagePath"],
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "ImagePath": image,
        "ID": id,
      };
}
