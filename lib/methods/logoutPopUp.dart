import 'package:flutter/material.dart';
import 'package:labtolab_app/methods/methods.dart';
import 'package:path_provider/path_provider.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

LogoutPopUp() {
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
    titleStyle: TextStyle(
      color: Colors.black,
    ),
    alertAlignment: Alignment.center,
  );

  Alert(
      style: alertStyle,
      context: Get.context!,
      type: AlertType.info,
      title: "هل تريد تسجيل الخروج؟",
      closeFunction: () {
        Get.back();
      },
      buttons: [
        DialogButton(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(20),
          onPressed: () => null,
          child: InkWell(
            onTap: () async {
              logOut();
            },
            child: Container(
              height: 50,
              width: Get.width - 200,
              child: Center(
                child: Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]).show();
}
