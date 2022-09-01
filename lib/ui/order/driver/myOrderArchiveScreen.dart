import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/driverOrderController.dart';
import 'package:labtolab_app/ui/order/driver/driverOrderCard.dart';
import 'package:labtolab_app/ui/order/secLab/orderCard.dart';

class MyOrderArchiveScreen extends StatelessWidget {
  MyOrderArchiveScreen({Key? key}) : super(key: key);
  DriverOrdersController controller = Get.put(DriverOrdersController());

  @override
  Widget build(BuildContext context) {
    controller.getOrderArchive();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "الطلبات",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: controller.isOrderArchive.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.temp.isEmpty
                                ? RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getOrderArchive();
                                    },
                                    child: ListView(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              child: Center(
                                                  child:
                                                      Text("لا يوجد بيانات"))),
                                        ),
                                      ],
                                    ),
                                  )
                                : RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getOrderArchive();
                                    },
                                    child: ListView.builder(
                                      itemCount: controller.temp.length,
                                      itemBuilder: (context, index) {
                                        return driverOrderCard(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
