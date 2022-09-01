import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/const.dart';
import 'package:labtolab_app/controllers/favouriteController.dart';
import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/methods/mapSheet.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
import 'package:labtolab_app/ui/customWidget/makeOrderPopUp.dart';
import 'package:labtolab_app/ui/customWidget/tenderCard.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TendersScreen extends StatelessWidget {
  MianLab lab;
  int? tenderId;
  // List<MianLab> mainLabs;

  TendersScreen(this.lab, [this.tenderId]) {
    controller.searchTenderId.value = tenderId == null ? 0 : tenderId!;
    
  }
  FavouriteController favController = Get.find();

  TendersController controller = Get.put(TendersController());
  @override
  Widget build(BuildContext context) {
    // controller.labId.value = lab.id;

    controller.getTendersById(lab.id);
    return Scaffold(
      backgroundColor: myGrey,
      body: Obx(
        () => controller.isLoadingTenders.value
            ? Container(
                height: Get.height,
                width: Get.width,
                child: Center(child: CircularProgressIndicator()),
              )
            : NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxScrolled) {
                  return <Widget>[
                    createSilverAppBar1(lab),
                    createSilverAppBar2()
                  ];
                },
                body: Container(
                    child: Container(
                  child: Column(
                    children: [
                      Obx(
                        () => controller.selectedTenders.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                height: 45,
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print(
                                        "pressssssssss . . .. . .. .. ....... . ... .. ");
                                    makeOrderPopUp(lab.id);
                                    // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
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
                                        children: [
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          // Container(
                                          //   child: Icon(
                                          //     Icons.arrow_back_ios,
                                          //     size: 16,
                                          //     color: Get.theme.primaryColor,
                                          //   ),
                                          // ),
                                          Expanded(
                                            child: Text(
                                              "إكمال الطلب",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Get.theme.primaryColor,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                      Expanded(
                        child: Obx(
                          () => Column(
                            children: [
                              Expanded(
                                child: controller.isLoadingTenders.value
                                    ? Container(
                                        child: Center(
                                            child: Container(
                                                width: 35,
                                                height: 35,
                                                child:
                                                    CircularProgressIndicator())))
                                    : Container(
                                        child: controller.temp.isEmpty
                                            ? Container(
                                                child: Center(
                                                    child:
                                                        Text("لا يوجد بيانات")))
                                            : ListView.builder(
                                                itemCount:
                                                    controller.temp.length,
                                                itemBuilder: (context, index) {
                                                  return tenderCard(
                                                      controller.temp[index]);
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
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
    // Scaffold(

    // backgroundColor: Colors.grey[100],
    // appBar: PreferredSize(
    //   preferredSize: Size.fromHeight(60),
    //   child: AppBar(
    //     elevation: 0,
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     backgroundColor: Get.theme.primaryColor,
    //     title: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: 5,
    //         ),
    //         Container(
    //           // margin: EdgeInsets.symmetric(horizontal: 5),
    //           height: 55,
    //           padding: EdgeInsets.symmetric(vertical: 3),
    //           child: CupertinoTextField(
    //             // controller: _filter,
    //             cursorHeight: 27,
    //             cursorColor: Colors.grey[800],
    //             textInputAction: TextInputAction.search,
    //             keyboardType: TextInputType.text,
    //             placeholder: 'أبحث في الفحوصات',
    //             placeholderStyle: TextStyle(
    //               color: Colors.grey,
    //               fontSize: 16,
    //             ),
    //             prefix: InkWell(
    //               onTap: () {
    //                 Get.back();
    //               },
    //               child: Padding(
    //                 padding: EdgeInsets.all(10),
    //                 child: Icon(
    //                   Icons.arrow_back,
    //                   color: Colors.grey[500],
    //                   size: 25,
    //                 ),
    //               ),
    //             ),
    //             style: TextStyle(fontSize: 20),
    //             // suffix: Padding(
    //             //   padding:
    //             //       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //             //   child: Image.asset(
    //             //     "assets/images/scannerLogo.png",
    //             //     width: 35,
    //             //   ),
    //             // ),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    // body: Container(
    //     child: Container(
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: Obx(
    //           () => Column(
    //             children: [
    //               Expanded(
    //                 child: controller.isLoadingTenders.value
    //                     ? Container(
    //                         child: Center(
    //                             child: Container(
    //                                 width: 35,
    //                                 height: 35,
    //                                 child: CircularProgressIndicator())))
    //                     : Container(
    //                         child: controller.tendersList.isEmpty
    //                             ? Container(
    //                                 child:
    //                                     Center(child: Text("لا يوجد بيانات")))
    //                             : ListView.builder(
    //                                 itemCount: controller.tendersList.length,
    //                                 itemBuilder: (context, index) {
    //                                   return tenderCard(
    //                                       controller.tendersList[index]);
    //                                 },
    //                                 scrollDirection: Axis.vertical,
    //                                 // // controller: _scrollController,
    //                                 // gridDelegate:
    //                                 //     SliverGridDelegateWithFixedCrossAxisCount(
    //                                 //   crossAxisCount: 2,
    //                                 //   childAspectRatio: (Get.width / 2) / 360,
    //                                 //   // crossAxisSpacing: 5.0,
    //                                 //   // mainAxisSpacing: 5.0,
    //                                 // ),
    //                               ),
    //                       ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // )),
    // );
  }

  SliverAppBar createSilverAppBar1(MianLab item) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 285,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 295,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: Get.width,
                            height: 100,
                            imageUrl: item.image,
                            placeholder: (context, url) => loadinImage(),
                            errorWidget: (context, url, error) => loadinImage(),
                          ),
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                    right: 10, top: 15, left: 10),
                                child: favController.needLogin.value
                                    ? Container()
                                    : InkWell(
                                        onTap: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();

                                          String? token =
                                              await prefs.getString('token');
                                          if (token != null) {
                                            int id = 0;
                                            if (favController.myFavourite.value
                                                .any((e) => e.id == item.id)) {
                                              print("yes");
                                              id = favController
                                                  .myFavourite.value
                                                  .indexWhere(
                                                      (e) => e.id == item.id)
                                                  .toInt();
                                              print(id);
                                              favController
                                                  .deleteFavourite(item.id);
                                            } else {
                                              print("no");

                                              favController
                                                  .addFavourite(item.id);
                                            }
                                          } else {
                                            Get.snackbar("يجب تسجيل الدخول",
                                                "يجب تسجيل الدخول",
                                                duration: Duration(seconds: 3),
                                                icon: Icon(
                                                  Icons.info,
                                                  color: Colors.white,
                                                ),
                                                colorText: Colors.white,
                                                backgroundColor: Get
                                                    .theme.primaryColorDark
                                                    .withOpacity(0.3));
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(22.5)),
                                              color: Colors.grey),
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                              child: Icon(
                                            Icons.favorite,
                                            color: favController
                                                    .myFavourite.value
                                                    .any((e) => e.id == item.id)
                                                ? Colors.red
                                                : Colors.white,
                                            size: 27,
                                          )),
                                        ),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 0, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Get.theme.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.adress,
                                          // textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Row(
                            //   children: [
                            //     Icon(Icons.delivery_dining_outlined,
                            //         size: 16, color: Colors.grey[500]),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text("نوع المختبر : ",
                            //         style: TextStyle(
                            //             fontSize: 15, color: Colors.grey[800])),
                            //     Text(item.labType.toString(),
                            //         style: TextStyle(
                            //             fontSize: 15, color: Colors.grey[800])),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text("الموقع على الخريطة",
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

                                            // print(item.activityId);
                                            // Get.dialog(popUpLoading(),
                                            //     barrierDismissible: false);

                                            // bool serviceEnabled =
                                            //     await Geolocator
                                            //         .isLocationServiceEnabled();

                                            // if (!serviceEnabled) {
                                            //   // location = null;
                                            //   EnableGpsPop(Get.context);
                                            // } else {
                                            //   location = await getLocation();
                                            // }
                                            // Get.back();
                                            MapsSheet.show(
                                              context: context,
                                              onMapTap: (map) {
                                                map.showMarker(
                                                  coords: Coords(
                                                    double.parse(item.lat),
                                                    double.parse(item.log),
                                                  ),
                                                  title: item.name.toString(),
                                                  // description: item.name,
                                                  zoom: 20,
                                                );
                                                // map.showMarker(
                                                //   coords: Coords(
                                                //     location.latitude,
                                                //     location.longitude,
                                                //   ),
                                                //   title: getTranslate(
                                                //       "currentLocation"),
                                                //   zoom: 18,
                                                // );
                                              },
                                            );
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
                                              Icons.location_on,
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    TendersController controller = Get.find();
    return SliverAppBar(
      elevation: 0,
      toolbarHeight: 55,

      // expandedHeight: 60,
      backgroundColor: Colors.white,

      pinned: true,
      iconTheme: IconThemeData(color: Colors.black),
      // automaticallyImplyLeading: false,

      title: InkWell(
        onTap: () {
          // Get.to(SearchScreen());
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 55,
          padding: EdgeInsets.symmetric(vertical: 3),
          child: CupertinoTextField(
            // controller: _filter,
            onSubmitted: (text) {
              controller.searchItems(text);
            },
            onChanged: (text) {
              controller.searchItems(text);
            },
            cursorHeight: 27,
            cursorColor: Colors.grey[800],
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            placeholder: 'أبحث في الفحوصات',
            placeholderStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            prefix: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.grey[500],
                  size: 25,
                ),
              ),
            ),
            style: TextStyle(fontSize: 20),
            // suffix: Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //   child: Image.asset(
            //     "assets/images/scannerLogo.png",
            //     width: 35,
            //   ),
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ),
          ),
        ),
      ),
    );
  }
}
