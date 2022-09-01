import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/notePopUp.dart';

Widget labInfoCard(Information item) {
  return Container(
    color: Colors.white,
    height: 150,
    margin: EdgeInsets.symmetric(
      horizontal: 5,
    ),
    width: Get.width - 100,
    child: InkWell(
      onTap: () {
        ShowNotePopUp(item);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                // Card(
                //   child: Container(
                //       width: 70,
                //       height: 70,
                //       child: Image.asset(
                //         "assets/images/labToLab2.jpeg",
                //         fit: BoxFit.cover,
                //       )
                //       //  CachedNetworkImage(
                //       //   fit: BoxFit.cover,
                //       //   width: 60,
                //       //   height: 60,
                //       //   imageUrl: list.img,
                //       //   placeholder: (context, url) => loadinImage(),
                //       //   errorWidget: (context, url, error) => loadinImage(),
                //       // ),
                //       ),
                //   elevation: 2,
                //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                // ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.description,
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
                    ],
                  ),
                ),
                // Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //   width: Get.width,
            //   height: 1,
            //   color: Colors.grey[200],
            // )
          ],
        ),
      ),
    ),
  );
}
