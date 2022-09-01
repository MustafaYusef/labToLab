import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/mainLabOrderController.dart';
import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/extentions.dart';
import 'package:labtolab_app/methods/getString.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../const.dart';

approveOrderPop(int id) {
  var alertStyle = alertStyleCustom();
  final _formKey = GlobalKey<FormState>();
  MainLabOrdersController controller = Get.find();
  Alert(
      style: alertStyle,
      context: Get.context!,
      type: AlertType.none,
      title: "تغيير الحالة",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Text(
                        //         getTranslate("أسم المريض"),
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.normal,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        TextFormField(
                          controller: controller.timeController,
                          keyboardType: TextInputType.text,
                          // maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: getTranslate("وقت التوصيل"),
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: textFieldStyle,
                              border: textFieldStyle,
                              enabledBorder: textFieldStyle,
                              contentPadding: EdgeInsets.all(10)),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (value) => value!.trim().isEmpty
                              ? getTranslate("وقت التوصيل")
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          height: 45,
          color: Get.theme.primaryColor,
          // padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          radius: BorderRadius.circular(10),
          onPressed: () {
            if (controller.timeController!.text.isNotEmpty) {
              controller.changeStatuse(id, 1);
            } else {
              showSnake("يرجى إكمال جميع الحقول");
            }
          },
          child: Container(
            // height: 70.0,
            // width: Get.width / 2,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "أرسال",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]).show();
}
