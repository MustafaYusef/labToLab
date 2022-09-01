import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/mainLabOrder.dart';
import 'package:labtolab_app/data/orderTenderData.dart';

import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/getString.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../const.dart';

class MainLabOrdersController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoadingTenders = false.obs;
  var isOrderTenders = false.obs;

  var labId = 0.obs;
  var myOrder = <MainLabOrder>[].obs;
  var temp = <MainLabOrder>[].obs;
  var tendersList = <TenderOrder>[].obs;
  TextEditingController? timeController;
  var conH = 100.0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    timeController = TextEditingController();
    getOrder();
    super.onInit();
  }

  // Future<void> searchItems(String query) async {
  //   List<Order> temp1 = <Order>[];

  //   temp.assignAll(tendersList);
  //   print(query);
  //   temp1 = <Order>[];
  //   temp.forEach((element) {
  //     if (element.tanderName.toLowerCase().contains(query.toLowerCase())) {
  //       temp1.add(element);
  //     }
  //   });
  //   print(temp1);

  //   if (temp1.isNotEmpty) {
  //     temp.assignAll(temp1);
  //   }
  // }
  Future<void> getTendersByOrderId(int orderId) async {
    isLoadingTenders.value = true;
    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.getOrderDetails(token, orderId);
      tendersList.assignAll(prof.tenders);
      isLoadingTenders.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingTenders.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingTenders.value = false;
    }
  }

  Future<void> changeStatuse(int orderId, int statuse) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = prefs.getString('token')!;
      final prof = await repo.changeOrderStatuse(
          token, orderId, statuse, timeController!.text.toString());
      timeController!.clear();
      Get.back();
      Get.back();
      getOrder();
      showSnake("تم تغيير حالة الطلب بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake("noInternet");
      noNetFlage.value = true;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      Get.back();
      showSnake(_.toString());
      print(_);
    }
  }

  Future<void> getOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      isOrderTenders.value = true;
      noNetFlage.value = false;

      try {
        String token = prefs.getString('token')!;

        final prof = await repo.getMainLabOrder(token);
        myOrder.assignAll(prof.order);
        temp.assignAll(prof.order);
        isOrderTenders.value = false;
      } on SocketException catch (_) {
        showSnake("noInternet");
        noNetFlage.value = true;
        isOrderTenders.value = false;

        // emit(MyOrdercubiteNoInternet());
      } catch (_) {
        // showSnake(_.toString());
        print(_);
        isOrderTenders.value = false;
      }
    }
  }
}
