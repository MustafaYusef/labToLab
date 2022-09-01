import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/controllers/mainLabOrderController.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/ui/order/mainLab/mainLabOrderCard.dart';
import 'package:labtolab_app/ui/order/secLab/orderCard.dart';

class MainLabOrderScreen extends StatelessWidget {
  MainLabOrderScreen({Key? key}) : super(key: key);
  MainLabOrdersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    child: controller.isOrderTenders.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.temp.isEmpty
                                ? Container(
                                    child:
                                        Center(child: Text("لا يوجد بيانات")))
                                : RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount: controller.temp.length,
                                      itemBuilder: (context, index) {
                                        return mainLabOrderCard(
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
