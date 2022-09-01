import 'package:labtolab_app/controllers/favouriteController.dart';
import 'package:labtolab_app/controllers/mainController.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/controllers/termsCondController.dart';
import 'package:labtolab_app/ui/customWidget/customDrawer.dart';
import 'package:labtolab_app/ui/customWidget/labInfoCard.dart';
import 'package:labtolab_app/ui/customWidget/mainLabCard.dart';
import 'package:labtolab_app/ui/infoSlider.dart';
import 'package:labtolab_app/ui/order/driver/driverOrderCard.dart';
import 'package:labtolab_app/ui/order/mainLab/mainLabOrderCard.dart';
import 'package:labtolab_app/ui/order/secLab/orderCard.dart';
import 'package:labtolab_app/ui/customWidget/shopCategoryCard.dart';
import 'package:labtolab_app/ui/order/secLab/searchScreen.dart';
import 'package:labtolab_app/ui/sliderSection.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import 'order/driver/myOrderScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  int _current = 0;
  int _currentInfo = 0;

  MainController mainController = Get.put(MainController());
  TermsController cont = Get.put(TermsController());
  // FavouriteController favouriteController = Get.put(FavouriteController());
  // ItemDetailsController cartController = Get.put(ItemDetailsController());
  FavouriteController controller = Get.put(FavouriteController());

  ScrollController listController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // listController
    //   ..addListener(() {
    //     // print("lisyt s,m,dms ..........   ");
    //     // print(listController.offset);
    //     if (listController.offset < mainController.conH.value) {
    //       if (listController.offset < 60) {
    //         mainController.conH.value = 100;
    //       } else {
    //         listController.animateTo(0,
    //             duration: Duration(milliseconds: 200), curve: Curves.ease);
    //         mainController.conH.value = 0;
    //       }
    //     }
    //   });
    return Scaffold(
        drawer: drawar(
          index: 0,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          // centerTitle: true,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),

          backgroundColor: Colors.grey[100],
          title: Image.asset(
            "assets/images/labLogo.png",
            width: 200,
            height: 75,
          ),
          actions: [
            Obx(
              () => mainController.role.value == "SecLabAdmin"
                  ? InkWell(
                      onTap: () {
                        Get.to(SearchScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return mainController.getMain();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    // controller: listController,
                    children: [
                      Container(
                        color: Colors.white,

                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => mainController.bannersLoading.value
                              ? Container(
                                  width: Get.width,
                                  height: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 125,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : sliderSection(
                                  current: _current,
                                  banners: mainController.mainBanners,
                                ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => mainController.isLoadingInfo.value
                            ? Container(
                                width: Get.width,
                                height: 150,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  enabled: true,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: ListView.builder(
                                        itemCount: 4,
                                        shrinkWrap: true,
                                        reverse: true,
                                        // scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: Get.width,
                                              height: 125,
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              )
                            : Container(
                                width: Get.width,
                                color: Colors.white,
                                height: 220,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Text(
                                            "المعلومات المختبرية",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InfoSlider(
                                      current: _currentInfo,
                                      banners: mainController.labInfoList,
                                    )
                                    // Expanded(
                                    //   child: ListView.builder(
                                    //       scrollDirection: Axis.horizontal,
                                    //       // shrinkWrap: true,
                                    //       // physics: NeverScrollableScrollPhysics(),

                                    //       // physics: FixedExtentScrollPhysics(),
                                    //       itemCount:
                                    //           mainController.labInfoList.length,
                                    //       // scrollDirection: Axis.horizontal,
                                    //       itemBuilder: (context, index) {
                                    //         return labInfoCard(mainController
                                    //             .labInfoList[index]);
                                    //       }),
                                    // ),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => mainController.role.value == "LabAmin"
                            ? Obx(
                                () => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "الطلبات الحديثة",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () {
                                              // Get.to(AllOfferPopularScreen(1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                "عرض المزيد",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    mainController
                                            .controller.isOrderTenders.value
                                        ? Container(
                                            child: Center(
                                                child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    child:
                                                        CircularProgressIndicator())))
                                        : Container(
                                            color: Colors.grey[100],
                                            child: mainController
                                                    .controller.temp.isEmpty
                                                ? Container(
                                                    child: Center(
                                                        child: Text(
                                                            "لا يوجد بيانات")))
                                                : Column(
                                                    children: [
                                                      ListView.builder(
                                                        itemCount:
                                                            mainController
                                                                .controller
                                                                .temp
                                                                .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return mainLabOrderCard(
                                                              mainController
                                                                  .controller
                                                                  .temp[index]);
                                                        },

                                                        // // controller: _scrollController,
                                                        // gridDelegate:
                                                        //     SliverGridDelegateWithFixedCrossAxisCount(
                                                        //   crossAxisCount: 2,
                                                        //   childAspectRatio: (Get.width / 2) / 360,
                                                        //   // crossAxisSpacing: 5.0,
                                                        //   // mainAxisSpacing: 5.0,
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                  ],
                                ),
                              )
                            : Container(
                                child: mainController.role.value == "DriverMan"
                                    ? Obx(
                                        () => Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    "الطلبات الحديثة",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          MyDriverOrderScreen());
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: Text(
                                                        "عرض المزيد",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Get.theme
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            mainController.driverController
                                                    .isOrderTenders.value
                                                ? Container(
                                                    child: Center(
                                                        child: Container(
                                                            width: 35,
                                                            height: 35,
                                                            child:
                                                                CircularProgressIndicator())))
                                                : Container(
                                                    color: Colors.grey[100],
                                                    child: mainController
                                                            .driverController
                                                            .temp
                                                            .isEmpty
                                                        ? Container(
                                                            child: Center(
                                                                child: Text(
                                                                    "لا يوجد بيانات")))
                                                        : Column(
                                                            children: [
                                                              ListView.builder(
                                                                itemCount:
                                                                    mainController
                                                                        .driverController
                                                                        .temp
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return driverOrderCard(
                                                                      mainController
                                                                          .driverController
                                                                          .temp[index]);
                                                                },

                                                                // // controller: _scrollController,
                                                                // gridDelegate:
                                                                //     SliverGridDelegateWithFixedCrossAxisCount(
                                                                //   crossAxisCount: 2,
                                                                //   childAspectRatio: (Get.width / 2) / 360,
                                                                //   // crossAxisSpacing: 5.0,
                                                                //   // mainAxisSpacing: 5.0,
                                                                // ),
                                                              ),
                                                            ],
                                                          ),
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  "المختبرات الرئيسية",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              // Container(
                                              //   margin: EdgeInsets.all(10),
                                              //   child: InkWell(
                                              //     onTap: () {
                                              //       // Get.to(AllOfferPopularScreen(1));
                                              //     },
                                              //     child: Padding(
                                              //       padding: const EdgeInsets.symmetric(
                                              //           horizontal: 5),
                                              //       child: Text(
                                              //         "عرض المزيد",
                                              //         style: TextStyle(
                                              //             fontSize: 17,
                                              //             color: Get.theme.primaryColor,
                                              //             fontWeight: FontWeight.bold),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          Obx(
                                            () => Container(
                                              color: Colors.white,
                                              // margin: EdgeInsets.symmetric(vertical: 10),
                                              // height: 140,
                                              width: Get.width,
                                              child: mainController
                                                      .isLoadingMainLabs.value
                                                  ? Container(
                                                      // height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Container(
                                                        child:
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.grey[300]!,
                                                          highlightColor:
                                                              Colors.grey[100]!,
                                                          enabled: true,
                                                          child: Container(
                                                            // margin: EdgeInsets.only(bottom: 45),
                                                            child: ListView
                                                                .builder(
                                                                    itemCount:
                                                                        5,
                                                                    shrinkWrap:
                                                                        true,
                                                                    reverse:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis
                                                                            .vertical,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Container(
                                                                        margin: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                10,
                                                                            horizontal:
                                                                                5),
                                                                        child:
                                                                            Card(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                Get.width,
                                                                            height:
                                                                                220,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                mainController
                                                                    .mainLabsList
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return mainLabCard(
                                                                mainController
                                                                        .mainLabsList[
                                                                    index],
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                      ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   // height: 300,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 5),
                      //         child: Text(
                      //           "السوبرماركت",
                      //           overflow: TextOverflow.ellipsis,
                      //           maxLines: 1,
                      //           style: TextStyle(
                      //               fontSize: 22,
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //       ListView.builder(
                      //           // shrinkWrap: true,
                      //           physics: ClampingScrollPhysics(),
                      //           shrinkWrap: true,
                      //           itemCount: 5,
                      //           scrollDirection: Axis.vertical,
                      //           itemBuilder: (context, index) {
                      //             return getWidgett(list[0]);
                      //           }),
                      //       Container(
                      //         margin: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 10),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.white),
                      //         height: 45,
                      //         width: Get.width,
                      //         child: ElevatedButton(
                      //           onPressed: () {
                      //             // Get.to(RegesterScreen());
                      //           },
                      //           style: ElevatedButton.styleFrom(
                      //             elevation: 1,
                      //             primary: Colors.white,
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(20.0)),
                      //             padding: EdgeInsets.all(0.0),
                      //           ),
                      //           child: Ink(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.green[300]!.withOpacity(0.1),
                      //                 // border: Border.all(color: Get.theme.primaryColor),
                      //                 borderRadius: BorderRadius.circular(20.0)),
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               child: Text(
                      //                 "عرض كل المتاجر (4)",
                      //                 textAlign: TextAlign.center,
                      //                 style: TextStyle(
                      //                     color: Colors.green[300], fontSize: 18),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
