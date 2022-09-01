import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/mainLabOrder.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/showImageScreen.dart';
import 'package:labtolab_app/ui/order/mainLab/myOrderDetailsScreen.dart';
import 'package:labtolab_app/ui/order/secLab/displayPdfScreen.dart';
import 'package:labtolab_app/ui/order/secLab/myOrderDetailsScreen.dart';

Widget mainLabOrderCard(MainLabOrder item) {
  String approveText = "تم ارسال النتائج";

  return InkWell(
    onTap: () {
      Get.to(MyOrderMainLabDetailsScreen(item));
    },
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      child: Container(
        height: item.orderStatus == approveText ? 390 : 360,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),

                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "أسم المختبر: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              item.secLab,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                          Text(
                            "أسم المريض: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              item.patientName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                          Text(
                            "عمر المريض: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.patientAge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "رمز المريض: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.patientCode,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "أسم السائق: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.driverMan,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "السعر: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.price + " IQD",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "الوقت: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.createdAt.toString().split(" ")[0] +
                                "    " +
                                item.createdAt
                                    .toString()
                                    .split(" ")[1]
                                    .split(".")[0],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            "نوع الطلب : ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.requestType,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "وقت التوصيل : ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.timeToResponse,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 40,
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor.withOpacity(0.2),
                                // border: Border.all(color: Get.theme.primaryColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.orderStatus,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Get.theme.primaryColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      item.orderStatus == approveText
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              width: Get.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (item.patientTestResult
                                          .toString()
                                          .substring(
                                              item.patientTestResult
                                                      .toString()
                                                      .length -
                                                  3,
                                              item.patientTestResult
                                                  .toString()
                                                  .length) ==
                                      "pdf") {
                                    Get.to(DisplayPdfScreen(
                                        item.patientTestResult));
                                  } else {
                                    Get.to(ShowImageScreen(
                                        item.patientTestResult));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  primary: Get.theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "عرض نتيجة الفحص",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                // Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
