import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/driverOrderController.dart';

import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/driverOrder.dart';
import 'package:labtolab_app/methods/locationEnablePop.dart';
import 'package:labtolab_app/methods/locationServices.dart';
import 'package:labtolab_app/methods/mapSheet.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:labtolab_app/ui/order/driver/trackSecLabScreen.dart';
import 'package:labtolab_app/ui/order/secLab/orderCard.dart';
import 'package:labtolab_app/ui/customWidget/tenderCard.dart';
import 'package:labtolab_app/ui/order/tenderCard.dart';
import 'package:map_launcher/map_launcher.dart';

class MyDriverOrderDetailsScreen extends StatefulWidget {
  DriverOrder item;
  DriverOrdersController controller = Get.find();

  MyDriverOrderDetailsScreen(this.item) {
    controller.getTendersByOrderId(item.id);
    if (item.orderStatus == "الناقل في الطريق") {
      controller.setGpswithLOc(item.id);
    }
  }

  @override
  State<MyDriverOrderDetailsScreen> createState() =>
      _MyDriverOrderDetailsScreenState();
}

class _MyDriverOrderDetailsScreenState
    extends State<MyDriverOrderDetailsScreen> {
  // int orderId;

  Position? location;

  // late Timer timer = Timer(Duration(seconds: 20), () {});

  // @override
  // void initState() {
  //   super.initState();
  //   // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  //   // if (!serviceEnabled) {
  //   //   // location = null;
  //   //   EnableGpsPop(Get.context);
  //   // } else {
  //   //   location = await getLocation();
  //   // }
  //   // // Get.back();
  //   // widget.controller.setGps(widget.item.id, location!.latitude.toString(),
  //   //     location!.longitude.toString());
  //   // if (widget.item.orderStatus == "الناقل في الطريق") {
  //   //   timer = Timer.periodic(Duration(seconds: 20), (Timer t) async {
  //   //     // Get.dialog(popUpLoading(), barrierDismissible: false);
  //   //     widget.controller.getLoc();
  //   //     // Get.back();
  //   //     widget.controller.setGps(widget.item.id,
  //   //         widget.controller.lat.toString(), widget.controller.lon.toString());
  //   //   });
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    String? getTextByStatus(String text) {
      String t;
      if (text == "2") {
        return "قبول الطلب";
      } else if (text == "3") {
        return "إستلام الطلب من المختبر";
      } else if (text == "4") {
        return "توصيل الطلب ";
      } else {
        return text;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "تفاصيل الطلب",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            elevation: 3,
            child: Container(
              height: 500,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " حالة الطلب ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
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
                                          children: [
                                            Expanded(
                                              child: Text(
                                                widget.item.orderStatus,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
                                    widget.item.mainLab,
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
                                  "المختبر الثانوي: ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.item.id.toString(),
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
                                    widget.item.patientName,
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
                                  widget.item.patientAge,
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
                                  widget.item.patientCode,
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
                                  widget.item.driverMan,
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
                                  widget.item.price + " IQD",
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
                                  widget.item.createdAt
                                          .toString()
                                          .split(" ")[0] +
                                      "    " +
                                      widget.item.createdAt
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
                                  widget.item.requestType,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            widget.item.timeToResponse == ""
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
                                        widget.item.timeToResponse,
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
                                widget.item.orderStatusCode == ""
                                    ? Container()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            height: 40,
                                            width: 200,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (widget
                                                        .item.orderStatusCode ==
                                                    "2") {
                                                  widget.controller
                                                      .approveByDriver(
                                                          widget.item.id,
                                                          widget.item
                                                              .orderStatusCode);
                                                } else if (widget
                                                        .item.orderStatusCode ==
                                                    "3") {
                                                  widget.controller
                                                      .handelFromLab(
                                                          widget.item.id);
                                                } else if (widget
                                                        .item.orderStatusCode ==
                                                    "4") {
                                                  widget.controller
                                                      .deliverToLab(
                                                          widget.item.id);
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 1,
                                                primary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    // border: Border.all(color: Get.theme.primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getTextByStatus(widget
                                                              .item
                                                              .orderStatusCode)!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                widget.item.orderStatus == "الناقل في الطريق"
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        height: 40,
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(TrackSecLabScreen(
                                                widget.item.id,
                                                double.parse(
                                                    widget.item.secLat),
                                                double.parse(
                                                    widget.item.secLog)));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 1,
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                color: Get.theme.primaryColor
                                                    .withOpacity(0.2),
                                                // border: Border.all(color: Get.theme.primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
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
                                                        color: Get
                                                            .theme.primaryColor,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.directions,
                                                    color:
                                                        Get.theme.primaryColor,
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
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text("الطريق إلى المختبر الثانوي",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[800])),
                                Expanded(child: Container()),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            print("item.activityId");
                                            print("item.activityId");
                                            Get.dialog(popUpLoading(),
                                                barrierDismissible: false);

                                            bool serviceEnabled =
                                                await Geolocator
                                                    .isLocationServiceEnabled();

                                            if (!serviceEnabled) {
                                              // location = null;
                                              EnableGpsPop(Get.context);
                                            } else {
                                              location = await getLocation();
                                            }
                                            Get.back();
                                            if (location != null) {
                                              MapsSheet.show(
                                                context: context,
                                                onMapTap: (map) {
                                                  print(
                                                      "widget.item.mainLat ... ......");
                                                  print(widget.item.mainLat);
                                                  map.showDirections(
                                                      destination: Coords(
                                                        double.parse(widget
                                                            .item.mainLat),
                                                        double.parse(widget
                                                            .item.mainLog),
                                                      ),
                                                      originTitle:
                                                          widget.item.secLab,
                                                      directionsMode:
                                                          DirectionsMode
                                                              .driving,
                                                      origin: Coords(
                                                        location!.latitude,
                                                        location!.longitude,
                                                      ),
                                                      destinationTitle:
                                                          widget.item.mainLab);
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300]!),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 20,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Icon(
                                              Icons.directions,
                                              size: 25,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("الطريق إلى المختبر الرئيسي",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[800])),
                                Expanded(child: Container()),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            print("item.activityId");
                                            Get.dialog(popUpLoading(),
                                                barrierDismissible: false);

                                            bool serviceEnabled =
                                                await Geolocator
                                                    .isLocationServiceEnabled();

                                            if (!serviceEnabled) {
                                              // location = null;
                                              EnableGpsPop(Get.context);
                                            } else {
                                              location = await getLocation();
                                            }
                                            Get.back();
                                            if (location != null) {
                                              MapsSheet.show(
                                                context: context,
                                                onMapTap: (map) {
                                                  map.showDirections(
                                                      destination: Coords(
                                                        double.parse(widget
                                                            .item.mainLat),
                                                        double.parse(widget
                                                            .item.mainLog),
                                                      ),
                                                      originTitle:
                                                          widget.item.mainLab,
                                                      directionsMode:
                                                          DirectionsMode
                                                              .driving,
                                                      origin: Coords(
                                                        location!.latitude,
                                                        location!.longitude,
                                                      ),
                                                      destinationTitle:
                                                          widget.item.secLab);
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300]!),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 20,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Icon(
                                              Icons.directions,
                                              size: 25,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
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
          Obx(
            () => widget.controller.isLoadingTenders.value
                ? Container(
                    child: Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            child: CircularProgressIndicator())))
                : Container(
                    color: Colors.grey[100],
                    child: widget.controller.tendersList.isEmpty
                        ? Container(
                            child: Center(child: Text("لا يوجد بيانات")))
                        : ListView.builder(
                            itemCount: widget.controller.tendersList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return tenderOrderCard(
                                  widget.controller.tendersList[index]);
                            },
                            scrollDirection: Axis.vertical,
                            // // controller: _scrollController,
                            // gridDelegate:
                            //     SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: 2,
                            //   childAspectRatio: (Get.width / 2) / 360,
                            //   // crossAxisSpacing: 5.0,
                            //   // mainAxisSpacing: 5.0,
                            // ),
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
