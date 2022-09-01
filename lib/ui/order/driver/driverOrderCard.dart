import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/driverOrder.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/methods/methods.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/order/driver/myOrderDetailsScreen.dart';
import 'package:labtolab_app/ui/order/driver/trackSecLabScreen.dart';
import 'package:labtolab_app/ui/order/secLab/myOrderDetailsScreen.dart';

Widget driverOrderCard(DriverOrder item) {
  // TendersController controller = Get.find();
  return InkWell(
    onTap: () {
      Get.to(MyDriverOrderDetailsScreen(item));
    },
    child: Card(
      color: hexToColor(item.orderStatusColorCode).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      child: Container(
        height: 350,
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
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "المختبر الرئيسي: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              item.mainLab,
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
                      Row(
                        children: [
                          Text(
                            "أسم المختبر الثانوي: ",
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
                      // Row(
                      //   children: [
                      //     Text(
                      //       "نتيجة الفحص : ",
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 1,
                      //       style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       item.patientTestResult,
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 1,
                      //       style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
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
                      item.timeToResponse == ""
                          ? Container()
                          : Row(
                              children: [
                                Text(
                                  "وقت التوصيل : ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            height: 40,
                            width: 200,
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
                                    color:
                                        Get.theme.primaryColor.withOpacity(0.2),
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
                          item.orderStatus == "الناقل في الطريق"
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  height: 40,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(TrackSecLabScreen(
                                          item.id,
                                          double.parse(item.secLat),
                                          double.parse(item.secLog)));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: Get.theme.primaryColor
                                              .withOpacity(0.2),
                                          // border: Border.all(color: Get.theme.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "تتبع",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Get.theme.primaryColor,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.directions,
                                              color: Get.theme.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
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
