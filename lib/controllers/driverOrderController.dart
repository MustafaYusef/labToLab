import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:labtolab_app/data/driverOrder.dart';
import 'package:labtolab_app/data/orderTenderData.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/locationEnablePop.dart';
import 'package:labtolab_app/methods/locationServices.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../const.dart';

class DriverOrdersController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoadingTenders = false.obs;
  var isOrderTenders = false.obs;
  var lat = "".obs;
  var lon = "".obs;

  var labId = 0.obs;
  var myOrder = <DriverOrder>[].obs;
  var temp = <DriverOrder>[].obs;
  var tendersList = <TenderOrder>[].obs;
  var isOrderArchive = false.obs;
  var conH = 100.0.obs;
  late final AudioCache _audioCache;

  @override
  void onInit() {
    repo = MainRepostary();
    _audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    getOrder();
    super.onInit();
  }

  Future<void> getLoc() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // location = null;
      EnableGpsPop(Get.context);
    } else {
      Position? l = await getLocation();
      lat.value = l!.latitude.toString();
      lon.value = l.longitude.toString();
      print("get gps .. .. . .....");
      print(lat.value);
      print(lon.value);
    }
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

  Future<void> approveByDriver(int orderId, String status) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.approveByDriver(token, orderId);
      if (status == "2") {
        Position? location;
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

        if (!serviceEnabled) {
          // location = null;
          EnableGpsPop(Get.context);
        } else {
          location = await getLocation();
        }
        final prof = await repo.setOrderGps(token, orderId,
            location!.latitude.toString(), location.longitude.toString());
        print("Set first Gps");
      }
      Get.back();
      Get.back();
      getOrder();
      showSnake("تم الموافقة على الطلب بنجاح");
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

  Future<void> setGpswithLOc(int orderId) async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    Position? location;
    noNetFlage.value = false;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        // location = null;
        EnableGpsPop(Get.context);
      } else {
        location = (await getLocation())!;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.setOrderGps(token, orderId,
          location!.latitude.toString(), location.longitude.toString());
      // showSnake("تم الموافقة على الطلب بنجاح");

      // Get.back();
      // Get.back();
      // getOrder();
      // showSnake("تم الموافقة على الطلب بنجاح");
    } on SocketException catch (_) {
      // Get.back();
      showSnake("noInternet");
      noNetFlage.value = true;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      // Get.back();
      showSnake(_.toString());
      print(_);
    }
  }

  Future<void> setGps(int orderId, String lat, String lon) async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.setOrderGps(token, orderId, lat, lon);
      print("send gps location .... . .. ...... .. .. .. .. .. ");
      // Get.back();
      // Get.back();
      // getOrder();
      // showSnake("تم الموافقة على الطلب بنجاح");
    } on SocketException catch (_) {
      // Get.back();
      showSnake("noInternet");
      noNetFlage.value = true;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      // Get.back();
      showSnake(_.toString());
      print(_);
    }
  }

  Future<void> handelFromLab(int orderId) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.handelOrderByDriver(token, orderId);

      Get.back();
      Get.back();
      getOrder();
      showSnake("تم إستلام الطلب بنجاح");
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

  Future<void> deliverToLab(int orderId) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.deliverOrderByDriver(token, orderId);

      Get.back();
      Get.back();
      getOrder();
      showSnake("تم توصيل الطلب بنجاح");
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
      print("roll lll ....... ... .. . .. . .. ..  ");
      print(prefs.getString('role'));
      isOrderTenders.value = true;
      noNetFlage.value = false;
      print("token .. .. ... .. .. . .. .. . .. . .. . ....   ");
      print(prefs.getString('token')!);
      try {
        String token = prefs.getString('token')!;

        final prof = await repo.getDriverNearOrder(token);
        if (myOrder.isNotEmpty) {
          if (prof.order.length > myOrder.length) {
            // player.play(alarmAudioPath);
            _audioCache.play('my_audio.mp3');
          }
        }

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

  Future<void> getOrderArchive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      isOrderArchive.value = true;
      noNetFlage.value = false;
      print("token .. .. ... .. .. . .. .. . .. . .. . ....   ");
      print(prefs.getString('token')!);
      try {
        String token = prefs.getString('token')!;

        final prof = await repo.getDriverOrders(token);
        myOrder.assignAll(prof.order.reversed);
        temp.assignAll(prof.order.reversed);
        isOrderArchive.value = false;
      } on SocketException catch (_) {
        showSnake("noInternet");
        noNetFlage.value = true;
        isOrderArchive.value = false;

        // emit(MyOrdercubiteNoInternet());
      } catch (_) {
        // showSnake(_.toString());
        print(_);
        isOrderArchive.value = false;
      }
    }
  }
}
