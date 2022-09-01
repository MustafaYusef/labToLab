import 'package:labtolab_app/const.dart';
import 'package:labtolab_app/controllers/favouriteController.dart';
import 'package:labtolab_app/data/favouriteModel.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/methods/methods.dart';
import 'package:labtolab_app/ui/auth/loginScreen.dart';
import 'package:labtolab_app/ui/tendersScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loadingImage.dart';

class favouriteCard extends StatelessWidget {
  FavouriteLab? item;
  // List<MianLab>? list;
  FavouriteController favController = Get.find();
  favouriteCard(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          String? token = prefs.getString('token');
          if (token == null) {
            logOut();
          } else {
            print(item!.id);
            Get.to(TendersScreen(MianLab(
                adress: item!.adress,
                id: item!.id,
                image: item!.image,
                labType: item!.labType,
                lat: item!.lat,
                log: item!.log,
                name: item!.name)));
          }
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: Get.width,
            height: 270,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        width: Get.width,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: item!.image,
                            placeholder: (context, url) => loadinImage(),
                            errorWidget: (context, url, error) => loadinImage(),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Obx(
                          () => Padding(
                            padding:
                                EdgeInsets.only(right: 10, top: 15, left: 10),
                            child: favController.needLogin.value
                                ? Container()
                                : InkWell(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();

                                      String? token =
                                          await prefs.getString('token');
                                      if (token != null) {
                                        int id = 0;
                                        if (favController.myFavourite.value
                                            .any((e) => e.id == item!.id)) {
                                          print("yes");
                                          id = favController.myFavourite.value
                                              .indexWhere(
                                                  (e) => e.id == item!.id)
                                              .toInt();
                                          print(id);
                                          favController
                                              .deleteFavourite(item!.id);
                                        } else {
                                          print("no");

                                          favController.addFavourite(item!.id);
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
                                        color: favController.myFavourite.value
                                                .any((e) => e.id == item!.id)
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
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item!.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item!.adress,
                                      // textAlign: TextAlign.center,
                                      maxLines: 1,
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
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            String? token = prefs.getString('token');
                            if (token == null) {
                              logOut();
                            } else {
                              print(item!.id);
                              Get.to(TendersScreen(MianLab(
                                  adress: item!.adress,
                                  id: item!.id,
                                  image: item!.image,
                                  labType: item!.labType,
                                  lat: item!.lat,
                                  log: item!.log,
                                  name: item!.name)));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                // border: Border.all(color: Get.theme.primaryColor),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "التفاصيل",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
