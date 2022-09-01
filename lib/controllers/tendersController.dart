import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:labtolab_app/data/tendersData.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/getString.dart';
import 'package:labtolab_app/methods/phoneId.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../const.dart';

class TendersController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoadingTenders = false.obs;
  var labId = 0.obs;
  var tendersList = <Tender>[].obs;
  var temp = <Tender>[].obs;
  var selectedTenders = <Tender>[].obs;
  TextEditingController? nameController;
  TextEditingController? ageController;
  var selectedDayType = "".obs;
  var orderType = ["طلب عادي", "طلب مستعجل"];
  var conH = 100.0.obs;
  var searchTenderId = 0.obs;
  @override
  void onInit() {
    nameController = TextEditingController();
    ageController = TextEditingController();

    repo = MainRepostary();

    super.onInit();
  }

  Future<void> searchItems(String query) async {
    List<Tender> temp1 = <Tender>[];

    temp.assignAll(tendersList);
    print(query);
    temp1 = <Tender>[];
    temp.forEach((element) {
      if (element.tanderName.toLowerCase().contains(query.toLowerCase())) {
        temp1.add(element);
      }
    });
    print(temp1);

    if (temp1.isNotEmpty) {
      temp.assignAll(temp1);
    }
  }

  Future<void> makeOrder(int labId) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      var playerId = await getId();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("player id .. .. .. ...... .. . .... ... . ..   ");
      print(playerId);
      String token = await prefs.getString('token')!;

      print("token    :" + token);
      List<TenderOb> list = <TenderOb>[];
      selectedTenders.forEach((e) {
        list.add(TenderOb(TenderId: e.id));
      });
      String encoded = jsonEncode(list);
      // final dd = await getProfile();\
      // print(list[0]);
      print(encoded);
      final login = await repo.makeOrder(
          token: token,
          age: ageController!.text.toString(),
          name: nameController!.text.toString(),
          labId: labId,
          player_id: playerId,
          tenders: list,
          selectedDayType: selectedDayType.value);

      Get.back();
      Get.back();
      selectedTenders.clear();
      ageController!.clear();
      nameController!.clear();
      // Get.dialog(null);
      showSnake("تم أرسال الطلب بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet());
    } catch (_) {
      Get.back();
      print(_.toString());
      showSnake(_.toString());
    }
  }

  Future<void> getTendersById(int id) async {
    isLoadingTenders.value = true;
    noNetFlage.value = false;
    try {
      final prof = await repo.getTenders(id);
      tendersList.assignAll(prof.tenders);
      temp.assignAll(prof.tenders);
      if (searchTenderId.value != 0) {
        selectedTenders
            .add(temp.firstWhere((e) => e.id == searchTenderId.value));
      }
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
}
