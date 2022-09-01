import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:labtolab_app/data/bannersData.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/labInfo.dart';
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

class SlidesController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  // var isLoadingTenders = false.obs;
  var isOrderTenders = false.obs;

  var labId = 0.obs;
  var labInfoList = <PromotionImage>[].obs;

  TextEditingController? timeController;
  var conH = 100.0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    timeController = TextEditingController();
    getLabInfo();
    super.onInit();
  }

  Future<void> getLabInfo() async {
    isOrderTenders.value = true;
    noNetFlage.value = false;

    try {
      final prof = await repo.getMainBanners();
      labInfoList.assignAll(prof.promotionImages);
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
