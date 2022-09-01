import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/labInfo.dart';
// import 'package:newTeami/bloc/ResourceCubit/resource_cubit.dart';
// import 'package:newTeami/ui/loginScreen.dart';
// import 'package:newTeami/ui/loginScreen.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

RatingPopUp(Order item) {
  // TextEditingController text = TextEditingController();
  OrdersController controller = Get.find();

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
      title: "تقييم الطلب",
      content: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: RatingBar.builder(
                initialRating: 0.0,
                minRating: 0.0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 3),
                itemSize: 35,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                glow: true,
                unratedColor: Colors.grey,
                glowColor: Colors.white,
                onRatingUpdate: (rating) {
                  controller.rating.value = rating.toInt();
                },
              )),
        ],
      ),
      buttons: [
        DialogButton(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(20),
          onPressed: () => null,
          child: InkWell(
            onTap: () async {
              controller.sendRating(item.id, 0);
            },
            child: Container(
              height: 50,
              width: Get.width - 200,
              child: Center(
                child: Text(
                  "أرسال",
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
