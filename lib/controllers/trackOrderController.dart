import 'dart:io';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart' as latLng;

class TrackOrderController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoading = false.obs;
  int orderId = 0;
  var position = latLng.LatLng(52.518611, 13.408056).obs;
  MapController mapController = MapController();

  @override
  void onInit() {
    repo = MainRepostary();
    super.onInit();
  }

  // Future<void> getOrderGps() async {
   
  // }
}
