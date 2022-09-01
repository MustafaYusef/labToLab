import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/extentions.dart';
import 'package:labtolab_app/methods/getString.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../const.dart';

makeOrderPopUp(int labId) {
  var alertStyle = alertStyleCustom();
  final _formKey = GlobalKey<FormState>();
  TendersController controller = Get.find();
  Alert(
      style: alertStyle,
      context: Get.context!,
      type: AlertType.none,
      title: "أكمال الطلب",
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
                          controller: controller.nameController,
                          keyboardType: TextInputType.text,
                          // maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: getTranslate("أسم المريض"),
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
                              ? getTranslate("أسم المريض")
                              : null,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Text(
                        //         "عمر المريض",
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.normal,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.ageController,
                          keyboardType: TextInputType.text,
                          // maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "عمر المريض",
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
                          validator: (value) =>
                              value!.trim().isEmpty ? "عمر المريض" : null,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Obx(
                              () => DropdownButton(
                                  underline: Container(),
                                  dropdownColor: Colors.white,
                                  hint: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text("نوع الطلب")),
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 24,
                                  ),
                                  value: controller.selectedDayType.value == ""
                                      ? null
                                      : controller.selectedDayType.value,
                                  items: controller.orderType.map((e) {
                                    return DropdownMenuItem(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              e,
                                              style: TextStyle(fontSize: 18),
                                            )),
                                          ],
                                        ),
                                      ),
                                      value: e,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    print(value);

                                    controller.selectedDayType.value =
                                        value.toString();
                                  }),
                            ),
                          ),
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
            if (controller.nameController!.text.isNotEmpty &&
                controller.ageController!.text.isNotEmpty &&
                controller.selectedDayType.value != "") {
              controller.makeOrder(labId);
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
                "أرسال الطلب",
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
