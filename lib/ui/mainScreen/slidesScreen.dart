import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/labInfoController.dart';
import 'package:labtolab_app/controllers/slidesController.dart';
import 'package:labtolab_app/ui/customWidget/labInfoCard.dart';
import 'package:labtolab_app/ui/customWidget/loadingImage.dart';

class SlidesScreen extends StatelessWidget {
  SlidesScreen({Key? key}) : super(key: key);
  SlidesController controller = Get.put(SlidesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,

        iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "الأعلانات",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: controller.isOrderTenders.value
                  ? Container(
                      height: Get.height - 200,
                      width: Get.width,
                      child: Center(
                          child: Container(
                              width: 35,
                              height: 35,
                              child: CircularProgressIndicator())))
                  : Container(
                      color: Colors.grey[100],
                      child: controller.labInfoList.isEmpty
                          ? RefreshIndicator(
                              onRefresh: () {
                                return controller.getLabInfo();
                              },
                              child: ListView(
                                children: [
                                  Expanded(
                                    child: Container(
                                        child: Center(
                                            child: Text("لا يوجد بيانات"))),
                                  ),
                                ],
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () {
                                return controller.getLabInfo();
                              },
                              child: ListView.builder(
                                itemCount: controller.labInfoList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 230,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      // child: Image.asset(
                                      //   "assets/images/labToLab2.jpeg",
                                      //   fit: BoxFit.cover,
                                      // ),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            controller.labInfoList[index].image,
                                        placeholder: (context, url) =>
                                            loadinImage(),
                                        errorWidget: (context, url, error) =>
                                            loadinImage(),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 3,
                                    ),
                                  );
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
            ),
          ],
        ),
      ),
    );
  }
}
