import 'package:get/get.dart';
import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:labtolab_app/data/searchModel.dart';
import 'package:flutter/material.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/ui/tendersScreen.dart';

Widget searchCard(SerchTender item) {
  // TendersController controller = Get.find();
  return InkWell(
    onTap: () {
      Get.to(TendersScreen(
          MianLab(
              adress: item.labAddress,
              id: item.labId,
              image: item.image,
              labType: "null",
              lat: item.lat,
              log: item.log,
              name: item.labName),
          item.tenderId));
    },
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      child: Container(
        height: 150,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(7),
                          child: Image.asset("assets/images/test.png")
                          //  CachedNetworkImage(
                          //   fit: BoxFit.cover,
                          //   width: 60,
                          //   height: 60,
                          //   imageUrl: list.img,
                          //   placeholder: (context, url) => loadinImage(),
                          //   errorWidget: (context, url, error) => loadinImage(),
                          // ),
                          ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
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
                            "أسم الفحص: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              item.tanderName.toString(),
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
                            "نوع الفاحص: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              item.checkerType.toString(),
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
                            "سعر الفحص: ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.price.toString() + " IQD",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
  );
}
