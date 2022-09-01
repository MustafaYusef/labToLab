import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/labInfoController.dart';
import 'package:labtolab_app/controllers/mainLabController.dart';
import 'package:labtolab_app/ui/customWidget/labInfoCard.dart';
import 'package:labtolab_app/ui/customWidget/mainLabCard.dart';
import 'package:labtolab_app/ui/order/mainLab/mainLabOrderCard.dart';

class MainLabScreen extends StatelessWidget {
  MainLabScreen({Key? key}) : super(key: key);
  MainLabController controller = Get.put(MainLabController());
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
          "المختبرات",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Get.theme.primaryColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.black,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      showCursor: true,
                      // controller: searchController,
                      onSubmitted: (text) {
                        controller.searchItems(text);
                      },
                      onChanged: (text) {
                        controller.searchItems(text);
                      },
                      textInputAction: TextInputAction.search,

                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 18),
                      decoration: new InputDecoration(
                          alignLabelWithHint: false,
                          filled: false,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          labelText: "بحث",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              backgroundColor: Colors.white,
                              decorationColor: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 10),
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),
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
                                itemCount: controller.labInfoListTemp.length,
                                itemBuilder: (context, index) {
                                  return mainLabCard(
                                      controller.labInfoListTemp[index]);
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
