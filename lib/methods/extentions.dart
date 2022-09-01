import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'getString.dart';

InputDecoration decorationTextField(
    {String? hint, IconData? iconSuff, IconData? iconPref, String? value}) {
  // OrderController controller = Get.find();
  return InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hoverColor: Colors.amber,
      hintText: value == null ? getTranslate(hint!) : value,
      labelText: value == null ? getTranslate(hint!) : value,
      labelStyle: TextStyle(
          fontSize: 16,
          backgroundColor: Colors.transparent,
          decorationColor: Colors.transparent),
      // counter: Text("${count}/${10}"),
      suffixIcon: Icon(
        iconSuff,
        color: Colors.grey,
      ),
      counterText: "",
      contentPadding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10)

      // counterText: "${count}/${10}",

      );
}

BoxDecoration textFieldBottomSheetDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey),
      color: Colors.white);
}

BoxDecoration appBarDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
      gradient: LinearGradient(
          colors: [Get.theme.primaryColor, Get.theme.primaryColorDark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1]));
}

InputDecoration noteInputDecoration(BuildContext context2) {
  return InputDecoration(
      alignLabelWithHint: false,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      hintStyle: new TextStyle(color: Colors.grey[800]),
      labelText: getTranslate('note'),
      labelStyle: TextStyle(
        fontSize: 16,
        backgroundColor: Colors.white,
      ),
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // if (FocusScope.of(context2).isFirstFocus) {
              FocusScope.of(context2).requestFocus(new FocusNode());
              // }
            },
            child: Container(
                width: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    getTranslate("ok"),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          ),
        ],
      ),
      prefixIcon: Icon(
        Icons.edit,
        color: Colors.black,
      ),
      contentPadding: EdgeInsets.all(7),
      fillColor: Colors.white70);
}

AlertStyle alertStyleCustom() {
  return AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,

    descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    overlayColor: Get.theme.primaryColor.withOpacity(0.5),
    alertPadding: EdgeInsets.all(10),
    buttonAreaPadding: EdgeInsets.symmetric(horizontal: 10),
    animationDuration: Duration(milliseconds: 200),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Colors.black, fontSize: 20),
    buttonsDirection: ButtonsDirection.column,
    alertAlignment: Alignment.center,
  );
}

InputDecoration orderFieldDecoration(String hint) {
  return new InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hoverColor: Colors.amber,
      labelText: getTranslate(hint),
      labelStyle: TextStyle(
          fontSize: 18,
          backgroundColor: Colors.transparent,
          decorationColor: Colors.transparent),
      // counter: Text("${count}/${10}"),

      counterText: "",
      contentPadding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10)

      // counterText: "${count}/${10}",
      );
}
