import 'package:labtolab_app/controllers/tendersController.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget tenderCard(Tender item) {
  TendersController controller = Get.find();
  return Obx(
    () => InkWell(
      onLongPress: () {
        if (!controller.selectedTenders.contains(item)) {
          controller.selectedTenders.add(item);
        }
      },
      onTap: () {
        if (!controller.selectedTenders.contains(item)) {
          // controller.selectedTenders.add(item);
        } else {
          controller.selectedTenders.remove(item);
        }
      },
      child: Card(
        color: controller.selectedTenders.contains(item)
            ? Colors.grey[400]
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        elevation: controller.selectedTenders.contains(item) ? 10 : 3,
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                item.tanderName,
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
                                item.checkerType,
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
                              item.price + " IQD",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            controller.selectedTenders.contains(item)
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: 40,
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (!controller.selectedTenders
                                            .contains(item)) {
                                          controller.selectedTenders.add(item);
                                        } else {
                                          controller.selectedTenders
                                              .remove(item);
                                        }

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
                                              Expanded(
                                                child: Text(
                                                  "تم الأختيار",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Get.theme.primaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: 40,
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (!controller.selectedTenders
                                            .contains(item)) {
                                          controller.selectedTenders.add(item);
                                        } else {
                                          controller.selectedTenders
                                              .remove(item);
                                        }

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
                                              Expanded(
                                                child: Text(
                                                  "طلب الفحص",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              // Container(
                                              //   child: Icon(
                                              //     Icons.arrow_forward_ios,
                                              //     size: 16,
                                              //     color: Get.theme.primaryColor,
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   width: 10,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
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
    ),
  );
}
