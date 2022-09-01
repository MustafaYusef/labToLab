import 'dart:io';
import 'package:labtolab_app/controllers/driverOrderController.dart';
import 'package:labtolab_app/controllers/mainLabOrderController.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/data/bannersData.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoadingMainLabs = false.obs;
  var isLoadingInfo = true.obs;
  var bannersLoading = true.obs;
  var mainLabsList = <MianLab>[].obs;
  var labInfoList = <Information>[].obs;
  var mainBanners = <PromotionImage>[].obs;
  var role = "".obs;
  var conH = 100.0.obs;
  MainLabOrdersController controller = Get.put(MainLabOrdersController());
  DriverOrdersController driverController = Get.put(DriverOrdersController());

  @override
  void onInit() {
    repo = MainRepostary();
    initss();
    getMain();
    super.onInit();
  }

  initss() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("role") == null
        ? role.value = ""
        : role.value = prefs.getString("role")!;
  }

  Future<void> getInfo() async {
    isLoadingInfo.value = true;
    noNetFlage.value = false;
    try {
      final prof = await repo.getLabInfo();
      labInfoList.assignAll(prof.informations);
      isLoadingInfo.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingInfo.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingInfo.value = false;
    }
  }

  Future<void> getMain() async {
    isLoadingMainLabs.value = true;
    noNetFlage.value = false;

    try {
      final prof = await repo.getMainLabs();

      mainLabsList.assignAll(prof.labs);
      isLoadingMainLabs.value = false;

      getBanners();
      getInfo();
      controller.getOrder();
      driverController.getOrder();
      // controller.getOrder();
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingMainLabs.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingMainLabs.value = false;
    }
  }

  Future<void> getBanners() async {
    bannersLoading.value = true;
    noNetFlage.value = false;

    try {
      final banners = await repo.getMainBanners();
      mainBanners.assignAll(banners.promotionImages);
      bannersLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      bannersLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      bannersLoading.value = false;
    }
  }
}
