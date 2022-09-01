import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:photo_view/photo_view.dart';

import 'loadingImage.dart';

class ShowImageScreen extends StatelessWidget {
  String image;
  ShowImageScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "نتيجة الفحص",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                // Saved with this method.
                Get.dialog(popUpLoading(), barrierDismissible: false);

                var imageId = await ImageDownloader.downloadImage(image);
                if (imageId == null) {
                  return;
                }
                Get.back();
                showSnake("تم حفظ الصورة في المعرض");
                // Below is a method of obtaining saved image information.
                var fileName = await ImageDownloader.findName(imageId);
                var path = await ImageDownloader.findPath(imageId);
                var size = await ImageDownloader.findByteSize(imageId);
                var mimeType = await ImageDownloader.findMimeType(imageId);
              } on PlatformException catch (error) {
                print(error);
                Get.back();
                showSnake(error.toString());
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: 45,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(Icons.download),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          width: Get.width,
          height: Get.height,
          imageBuilder: (context, imageProvider) => PhotoView(
            imageProvider: imageProvider,
          ),
          imageUrl: image,
          placeholder: (context, url) => loadinImage(),
          errorWidget: (context, url, error) => loadinImage(),
        ),
      ),
    );
  }
}
