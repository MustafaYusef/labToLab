import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/mainLabOrder.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:labtolab_app/data/orderTenderData.dart';

import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/getString.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../const.dart';

class MainLabController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  // var isLoadingTenders = false.obs;
  var isOrderTenders = false.obs;

  var labId = 0.obs;
  var labInfoList = <MianLab>[].obs;
  var labInfoListTemp = <MianLab>[].obs;

  TextEditingController? timeController;
  var conH = 100.0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    timeController = TextEditingController();
    getLabInfo();
    super.onInit();
  }

  Future<void> searchItems(String query) async {
    List<MianLab> temp1 = <MianLab>[];

    // labInfoListTemp.assignAll(tendersList);
    print(query);
    temp1 = <MianLab>[];
    labInfoList.forEach((element) {
      if (element.name.toLowerCase().contains(query.toLowerCase())) {
        temp1.add(element);
      }
    });
    print(temp1);

    if (temp1.isNotEmpty) {
      labInfoListTemp.assignAll(temp1);
    }
  }

  Future<void> getLabInfo() async {
    isOrderTenders.value = true;
    noNetFlage.value = false;

    try {
      final prof = await repo.getMainLabs();
      labInfoList.assignAll(prof.labs);
      labInfoListTemp.assignAll(prof.labs);
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
