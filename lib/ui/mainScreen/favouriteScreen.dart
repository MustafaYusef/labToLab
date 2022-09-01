import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/favouriteController.dart';
import 'package:labtolab_app/ui/customWidget/favouriteCard.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  FavouriteController controller = Get.find();
  // CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    // controller.getShopItem(catId, shopId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          // automaticallyImplyLeading: false,
          backgroundColor: Get.theme.primaryColor,
          title: Text("المختبرات المفضلة",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: controller.isLoading.value
                  ? Container(
                      child: Center(
                          child: Container(
                              width: 35,
                              height: 35,
                              child: CircularProgressIndicator())))
                  : Container(
                      child: controller.myFavourite.isEmpty
                          ? RefreshIndicator(
                              onRefresh: () {
                                return controller.getFavourite();
                              },
                              child: ListView(
                                children: [
                                  Container(
                                      height: Get.height,
                                      child: Center(
                                          child: Text("لا يوجد بيانات"))),
                                ],
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () {
                                return controller.getFavourite();
                              },
                              child: ListView.builder(
                                itemCount: controller.myFavourite.length,
                                itemBuilder: (context, index) {
                                  return favouriteCard(
                                      controller.myFavourite[index]);
                                },
                                // scrollDirection: Axis.vertical,
                                // controller: _scrollController,
                                // gridDelegate:
                                //     SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   childAspectRatio:
                                //       (Get.width / 2) / 310,
                                // crossAxisSpacing: 5.0,
                                // mainAxisSpacing: 5.0,
                                // ),
                              ),
                            ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
