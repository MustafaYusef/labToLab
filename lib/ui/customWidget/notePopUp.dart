import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/data/labInfo.dart';
// import 'package:newTeami/bloc/ResourceCubit/resource_cubit.dart';
// import 'package:newTeami/ui/loginScreen.dart';
// import 'package:newTeami/ui/loginScreen.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

ShowNotePopUp(Information item) {
  // TextEditingController text = TextEditingController();

  // print("time ....  " + dateTimeNow.toString());
  var alertStyle = AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,

    descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    // alertPadding: EdgeInsets.all(10),
    animationType: AnimationType.grow,
    // buttonAreaPadding: EdgeInsets.all(10),
    animationDuration: Duration(milliseconds: 400),
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
      type: AlertType.none,
      title: item.title,
      content: Text(
        item.description,
        style: TextStyle(
            fontSize: 16, fontStyle: FontStyle.normal, color: Colors.grey[600]),
      ),
      buttons: [
        // DialogButton(
        //   color: Theme.of(contex2).primaryColor,
        //   padding: EdgeInsets.symmetric(vertical: 5),
        //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        //   radius: BorderRadius.circular(20),
        //   onPressed: () => null,
        //   child: InkWell(
        //     onTap: () async {
        //       SharedPreferences prefs = await SharedPreferences.getInstance();
        //       await prefs.clear();
        //       data = null;
        //       Navigator.of(contex2)
        //           .pushReplacement(MaterialPageRoute(builder: (_) {
        //         return LoginScreen();
        //       }));
        //     },
        //     child: Container(
        //       height: 50,
        //       width: MediaQuery.of(contex2).size.width - 200,
        //       child: Center(
        //         child: Text(
        //           "logout",
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold),
        //         ).tr(),
        //       ),
        //     ),
        //   ),
        // )
      ]).show();
}
