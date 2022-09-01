import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/ui/order/secLab/orderArchivCard%20.dart';
import 'package:labtolab_app/ui/order/secLab/orderCard.dart';
import 'package:wakelock/wakelock.dart';

class MyArchiveOrderScreen extends StatefulWidget {
  MyArchiveOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyArchiveOrderScreen> createState() => _MyArchiveOrderScreenState();
}

class _MyArchiveOrderScreenState extends State<MyArchiveOrderScreen> {
  OrdersController controller = Get.put(OrdersController());

  // late Timer timer;

  // @override
  // void initState() {
  //   super.initState();
  //   Wakelock.enable();
  //   timer = Timer.periodic(Duration(seconds: 20), (Timer t) {
  //     // controller.isRefresh.value = true;
  //     controller.getOrder();
  //   });
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   Wakelock.disable();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    controller.getArchiveOrder();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "الطلبات السابقة",
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
                    child: controller.isOrderArchivLoading.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.myArchivOrder.isEmpty
                                ? Container(
                                    child:
                                        Center(child: Text("لا يوجد بيانات")))
                                : RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getArchiveOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount:
                                          controller.myArchivOrder.length,
                                      itemBuilder: (context, index) {
                                        return orderArchivCard(
                                            controller.myArchivOrder[index]);
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
