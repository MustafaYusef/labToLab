import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';

LocationNotAvailable() {
  // TextEditingController text = TextEditingController();
  // print("time ....  " + dateTimeNow.toString());
  var alertStyle = AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,

    descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    alertPadding: EdgeInsets.all(10),
    buttonAreaPadding: EdgeInsets.all(10),
    animationDuration: Duration(milliseconds: 200),

    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),

    alertAlignment: Alignment.center,
  );

  Alert(
      style: alertStyle,
      context: Get.context!,
      image: Icon(
        Icons.location_disabled,
        color: Get.theme.primaryColor,
        size: 70,
      ),
      title: "الموقع غير متوفر",
      content: Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Center(
              child: Text(
            "tryChangeLocation",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ).tr())),
      buttons: [
        DialogButton(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(10),
          onPressed: () {
            Get.back();
          },
          child: InkWell(
            onTap: () {
              // location = null;
              // Geolocator.openLocationSettings();
              Get.back();
            },
            child: Container(
              height: 50,
              width: Get.width - 200,
              child: Center(
                child: Text(
                  "ok",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
          ),
        )
      ]).show();
}
