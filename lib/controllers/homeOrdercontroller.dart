import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/phoneId.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeOrderController extends GetxController {
  late MainRepostary repo;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController sampleController;

  var noNetFlage = false.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    nameController = TextEditingController();
    ageController = TextEditingController();
    sampleController = TextEditingController();

    super.onInit();
  }

  Future<void> sendOrder() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      var playerId = await getId();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.makeOrderHome(
          token: token,
          player_id: playerId,
          name: nameController.text.toString(),
          patientAge: ageController.text.toString(),
          sampleType: sampleController.text.toString());
      Get.back();
      Get.back();
      nameController.clear();
      ageController.clear();
      sampleController.clear();

      showSnake("تم ارسال الطلب بنجاح");
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
}
