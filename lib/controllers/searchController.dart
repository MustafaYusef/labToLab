import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:labtolab_app/data/searchModel.dart';

import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../const.dart';

class SearchController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  // var isLoadingTenders = false.obs;
  var isOrderTenders = false.obs;

  var labId = 0.obs;
  var labInfoList = <SerchTender>[].obs;

  TextEditingController? timeController;
  var conH = 100.0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    timeController = TextEditingController();

    super.onInit();
  }

  Future<void> searchItems(String text) async {
    isOrderTenders.value = true;
    noNetFlage.value = false;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("player id .. .. .. ...... .. . .... ... . ..   ");
      String token = await prefs.getString('token')!;
      final prof = await repo.serchItem(token, text);
      labInfoList.assignAll(prof.tender);
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
