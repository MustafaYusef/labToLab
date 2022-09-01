import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:labtolab_app/controllers/mainController.dart';
import 'package:labtolab_app/controllers/mainLabOrderController.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/controllers/termsCondController.dart';
import 'package:labtolab_app/methods/logoutPopUp.dart';
import 'package:labtolab_app/methods/methods.dart';
import 'package:labtolab_app/ui/auth/loginScreen.dart';
import 'package:labtolab_app/ui/customWidget/termsPopUp.dart';
import 'package:labtolab_app/ui/mainScreen/favouriteScreen.dart';
import 'package:labtolab_app/ui/order/driver/myOrderArchiveScreen.dart';
import 'package:labtolab_app/ui/order/driver/myOrderScreen.dart';
import 'package:labtolab_app/ui/order/mainLab/myOrderScreen.dart';
import 'package:labtolab_app/ui/order/secLab/myOrderArchiveScreen.dart';
import 'package:labtolab_app/ui/order/secLab/myOrderScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../contactUsScreen.dart';
import '../makeHomeOrder.dart';

class drawar extends StatefulWidget {
  int index;
  // int notifNum=0;
  //  int cartNum=0;
  drawar({required this.index});

  @override
  _drawarState createState() => _drawarState();
}

class _drawarState extends State<drawar> {
  String name = "";

  String? token;
  String role = "";
  double distance = 0;
  TermsController controller = Get.find();
  int notifNum = 0;
  int cartNum = 0;
  String labName = "";
  String userName = "";
  // final UploadOfflineController _uploadController =
  //     Get.put(UploadOfflineController());
  @override
  void initState() {
    super.initState();
    getImage();
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
      if (token != null) {
        role = prefs.getString('role')!;
        labName = prefs.getString('labName')!;
        userName = prefs.getString('userName')!;
      }
    });
  }

  // final OfflineController _collController = Get.put(OfflineController());
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (cont) {
      return Drawer(
        child: Container(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          color: Get.theme.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 150,
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   child: Container(
                              //     width: 70,
                              //     height: 70,
                              //     decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         borderRadius: BorderRadius.circular(60)),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(20.0),
                              //       child: Image.asset(
                              //         "assets/images/person_logo.png",
                              //         // height: 100,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              token == null
                                  ? Container(
                                      // margin: EdgeInsets.only(bottom: 30),
                                      child: Text(
                                        "سجل الدخول / إنشاء حساب",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        role == "DriverMan"
                                            ? Container()
                                            : Container(
                                                // margin: EdgeInsets.only(bottom: 30),
                                                child: Text(
                                                  labName.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            userName.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          )),
                      // Container(
                      //     color: Get.theme.primaryColor,
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 20),
                      //     height: 170,
                      //     width: Get.width,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Container(
                      //           child: Container(
                      //             width: 70,
                      //             height: 70,
                      //             decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.circular(60)),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(20.0),
                      //               child: Image.asset(
                      //                 "assets/images/person_logo.png",
                      //                 // height: 100,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 20,
                      //         ),
                      //         token == null
                      //             ? Container(
                      //                 // margin: EdgeInsets.only(bottom: 30),
                      //                 child: Text(
                      //                   "سجل الدخول / إنشاء حساب",
                      //                   style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: Colors.white,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                 ),
                      //               )
                      //             : Container(),
                      //       ],
                      //     )),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Scaffold.of(cont).openEndDrawer();
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("الرئيسية",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.home,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),

                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      role == "SecLabAdmin"
                          ? Container(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  Scaffold.of(cont).openEndDrawer();
                                  Get.to(HomeOrderScreen());
                                },
                                selected: widget.index == 0 ? true : false,
                                title: Text("السحب المنزلي",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    )).tr(),
                                leading: Icon(
                                  Icons.add,
                                  color: Colors.grey[600],
                                  size: 25,
                                ),
                              ),
                            )
                          : Container(),

                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () async {
                            Scaffold.of(cont).openEndDrawer();
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            if (prefs.getString('token') == null) {
                              logOut();
                            } else {
                              if (prefs.getString('role') == "LabAmin") {
                                Get.to(MainLabOrderScreen());
                              } else if (prefs.getString('role') ==
                                  "DriverMan") {
                                Get.to(MyDriverOrderScreen());
                              } else {
                                Get.to(MyOrderScreen());
                              }
                            }
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("متابعة الطلبات",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.list,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      role == "LabAmin"
                          ? Container()
                          : Container(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () async {
                                  Scaffold.of(cont).openEndDrawer();
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  if (prefs.getString('token') == null) {
                                    logOut();
                                  } else {
                                    if (prefs.getString('role') ==
                                        "DriverMan") {
                                      Get.to(MyOrderArchiveScreen());
                                    } else {
                                      Get.to(MyArchiveOrderScreen());
                                    }
                                  }
                                },
                                selected: widget.index == 0 ? true : false,
                                title: Text("الطلبات السابقة",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    )).tr(),
                                leading: Icon(
                                  Icons.list,
                                  color: Colors.grey[600],
                                  size: 25,
                                ),
                              ),
                            ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      role == "SecLabAdmin"
                          ? Container(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  Scaffold.of(cont).openEndDrawer();
                                  Get.to(FavouriteScreen());
                                },
                                selected: widget.index == 0 ? true : false,
                                title: Text("المختبرات المفضلة",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    )).tr(),
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[600],
                                  size: 25,
                                ),
                              ),
                            )
                          : Container(),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            TermsPopUp(
                                controller.labInfoList.value[0].about, 1);
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("من نحن",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.info,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            TermsPopUp(controller.labInfoList.value[0].term, 2);
                            // Scaffold.of(cont).openEndDrawer();
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("الشروط والأحكام",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.padding,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Get.to(
                                ContactUsScreen(controller.contactModel.value));
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("أتصل بنا",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.contact_phone,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () async {
                            Scaffold.of(cont).openEndDrawer();
                            LogoutPopUp();
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("تسجيل الخروج",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      // Divider(
                      //   height: 0.5,
                      //   color: Colors.white,
                      // ),
                      // Container(
                      //   color: Colors.white,
                      //   child: ListTile(
                      //     onTap: () {
                      //       Scaffold.of(cont).openEndDrawer();
                      //     },
                      //     selected: widget.index == 0 ? true : false,
                      //     title: Text("المفضلة",
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Colors.grey[600],
                      //         )).tr(),
                      //     leading: Icon(
                      //       Icons.favorite,
                      //       color: Colors.grey[600],
                      //       size: 30,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: Get.height - 200,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}
