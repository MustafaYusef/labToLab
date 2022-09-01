import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:labtolab_app/controllers/trackOrderController.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/locationEnablePop.dart';
import 'package:labtolab_app/methods/locationServices.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

// import 'custumWidget/customDrawer.dart';

class TrackSecLabScreen extends StatefulWidget {
  int orderId;
  double labLat;
  double labLon;
  // TrackOrderController controller = Get.put(TrackOrderController());
  TrackSecLabScreen(this.orderId, this.labLat, this.labLon) {
    // controller.orderId = orderId;
    // controller.getOrderGps();
  }
  @override
  State<TrackSecLabScreen> createState() => MapScreenState();
}

class MapScreenState extends State<TrackSecLabScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late Timer timer;
  // TrackOrderController controller = Get.find();

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    labLocation();
    moveCamera();

    timer = Timer.periodic(Duration(seconds: 20), (Timer t) {
      // controller.isRefresh.value = true;
      moveCamera();
    });
  }

  labLocation() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);

    // isLoading.value = true;
    // noNetFlage.value = false;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        // location = null;
        EnableGpsPop(Get.context);
      } else {
        location = await getLocation();
      }
      double lat1 = 0;
      double lon1 = 0;
      lat1 = location!.latitude;
      lon1 = location!.longitude;
      final GoogleMapController controller = await _controller.future;

      setState(() {
        markers.add(Marker(
            markerId: MarkerId("1"),
            draggable: false,
            // icon: BitmapDescriptor.fromAssetImage(
            //     ImageConfiguration.empty, "assets/images/shipment.png"),
            infoWindow: InfoWindow(title: "موقعك الحالي"),
            // onDragEnd: ((value) {
            //   lat1 = value.latitude;
            //   lon1 = value.longitude;
            // }),
            position: LatLng(lat1, lon1)));
        markers.add(Marker(
            markerId: MarkerId("2"),
            draggable: true,
            infoWindow: InfoWindow(title: "موقع المختبر"),
            // onDragEnd: ((value) {
            //   lat1 = value.latitude;
            //   lon1 = value.longitude;
            // }),
            position: LatLng(widget.labLat, widget.labLon)));
      });
    } on SocketException catch (_) {
      showSnake("noInternet");
      // noNetFlage.value = true;
      // isLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      // isLoading.value = false;
    }
    // Get.back();
    // lat = location!.latitude;
    // lon = location!.longitude;

    // getNum();
    // if (widget.numCall != 1) {
    //   showAlertDragPin(context);
    // }
  }

  @override
  void dispose() {
    timer.cancel();
    Wakelock.disable();

    super.dispose();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  Position? location;

  // double lat = 0;
  // double lon = 0;
  MainRepostary repo = MainRepostary();
  List<Marker> markers = [];
  moveCamera() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);

    // isLoading.value = true;
    // noNetFlage.value = false;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        // location = null;
        EnableGpsPop(Get.context);
      } else {
        location = await getLocation();
      }
      double lat1 = 0;
      double lon1 = 0;
      lat1 = location!.latitude;
      lon1 = location!.longitude;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = await prefs.getString('token')!;
      final prof = await repo.setOrderGps(
          token, widget.orderId, lat1.toString(), lon1.toString());
      // lat = double.parse(prof.order.lat);
      // lon = double.parse(prof.order.log);
      final GoogleMapController controller = await _controller.future;
      controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          // bearing: 192.8334901395799,
          target: LatLng(lat1, lon1),
          tilt: 59.440717697143555,
          zoom: 16.151926040649414)));
      setState(() {
        markers.add(Marker(
            markerId: MarkerId("1"),
            draggable: false,
            infoWindow: InfoWindow(title: "موقعك الحالي"),
            // onDragEnd: ((value) {
            //   lat = value.latitude;
            //   lon = value.longitude;
            // }),
            position: LatLng(lat1, lon1)));
      });
    } on SocketException catch (_) {
      showSnake("noInternet");
      // noNetFlage.value = true;
      // isLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      // isLoading.value = false;
    }
    // Get.back();
    // lat = location!.latitude;
    // lon = location!.longitude;

    // getNum();
    // if (widget.numCall != 1) {
    //   showAlertDragPin(context);
    // }
  }

  int notifNum = 0;
  int cartNum = 0;

  // getNum() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //  ÷
  // }

  bool mapType = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // endDrawer: drawar(index: 0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "موقع المختبر",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          GoogleMap(
            rotateGesturesEnabled: true,
            markers: Set.from(markers),
            mapType: mapType ? MapType.normal : MapType.satellite,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   margin:
                //       EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                //   width: 60,
                //   height: 60,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(30),
                //     child: RaisedButton(
                //       color: Theme.of(context).primaryColor,
                //       elevation: 5,
                //       child: Icon(
                //         Icons.my_location,
                //         color: Colors.white,
                //       ),
                //       onPressed: moveCamera,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 5,
                      child: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (mapType) {
                            mapType = false;
                          } else {
                            mapType = true;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: !isLoading
          //       ? Container(
          //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           width: MediaQuery.of(context).size.width,
          //           height: 55,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(15),
          //             child: RaisedButton(
          //                 color: Theme.of(context).primaryColor,
          //                 elevation: 5,
          //                 child: Directionality(
          //                   textDirection: TextDirection.rtl,
          //                   child: Text("أرسال الطلب",
          //                       style: TextStyle(
          //                           color: Colors.white, fontSize: 24)),
          //                 ),
          //                 onPressed: () async {
          //                   MainRepastory repo = MainRepastory();
          //                   setState(() {
          //                     isLoading = true;
          //                   });
          //                   SharedPreferences prefs =
          //                       await SharedPreferences.getInstance();
          //                   var token = await prefs.getString('token');

          //                   if (widget.id == null) {
          //                     try {
          //                       final res =
          //                           await repo.makeNormalOrder(token, lat, lon);
          //                       //showAlertDialog(context);
          //                       showAlert(context);
          //                     } on SocketException catch (_) {
          //                       Toast.show("لا يوجد اتصال بالشبكة", context,
          //                           duration: Toast.LENGTH_LONG,
          //                           gravity: Toast.BOTTOM);
          //                     } catch (_) {
          //                       Toast.show(_, context,
          //                           duration: Toast.LENGTH_LONG,
          //                           gravity: Toast.BOTTOM);
          //                     }
          //                   } else {
          //                     try {
          //                       final res = await repo.makePackageOrder(
          //                           token,
          //                           lat,
          //                           lon,
          //                           widget.sum,
          //                           widget.itemsId,
          //                           widget.counts,
          //                           widget.newcounts,
          //                           widget.id);
          //                       showAlert(context);
          //                     } on SocketException catch (_) {
          //                       Toast.show("لا يوجد اتصال بالشبكة", context,
          //                           duration: Toast.LENGTH_LONG,
          //                           gravity: Toast.BOTTOM);
          //                     } catch (_) {
          //                       Toast.show(_.toString(), context,
          //                           duration: Toast.LENGTH_LONG,
          //                           gravity: Toast.BOTTOM);
          //                     }
          //                   }

          //                   setState(() {
          //                     isLoading = false;
          //                   });
          //                   // Toast.show("تم ارسال الطلب ينجاح", context,
          //                   //     duration: Toast.LENGTH_LONG,
          //                   //     gravity: Toast.BOTTOM);
          //                 }),
          //           ),
          //         )
          //       : Theme(
          //           child: CircularProgressIndicator(),
          //           data: new ThemeData(
          //             primaryColor: Colors.blueAccent,
          //             primaryColorDark: Colors.red,
          //           ),
          //         ),
          // )
        ]),
      ),
    );
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart' as latLng;

// import 'package:labtolab_app/controllers/trackOrderController.dart';
// // / import 'package:latlong/latlong.dart' as latLng;
// // import 'package:latlong/latlong.dart';
// // import 'package:latlong/latlong.dart';

// class TrackDriverScreen extends StatefulWidget {
//   int orderId;
//   TrackOrderController controller = Get.put(TrackOrderController());
//   TrackDriverScreen(
//     this.orderId,
//   ) {
//     controller.orderId = orderId;
//     controller.getOrderGps();
//   }

//   @override
//   State<TrackDriverScreen> createState() => _TrackDriverScreenState();
// }

// class _TrackDriverScreenState extends State<TrackDriverScreen> {
//   late Timer timer;
//   TrackOrderController controller = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(Duration(seconds: 20), (Timer t) {
//       // controller.isRefresh.value = true;
//       controller.getOrderGps();
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("تتبع السائق"),
//         backgroundColor: Get.theme.primaryColor,
//         actions: [
//           Obx(
//             () => Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: widget.controller.isLoading.value
//                   ? Container(
//                       height: 25,
//                       width: 25,
//                       margin:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//                       child: Center(
//                           child: CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 3,
//                       )))
//                   : Container(),
//             ),
//           ),
//         ],
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           // center: controller.position.value,
//           zoom: 15.0,
//         ),
//         mapController: widget.controller.mapController,
//         layers: [
//           TileLayerOptions(
//             urlTemplate:
//                 "https://api.mapbox.com/styles/v1/mustafayusef/ckegu4r9k36u619pt36t588x8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibXVzdGFmYXl1c2VmIiwiYSI6ImNrZWdzbnB4dzFwYjQycm1peHJ4YzRwb3cifQ.-PryqEA317YbkPX-Rmtm4g",
//             additionalOptions: {
//               "accessToken":
//                   "pk.eyJ1IjoibXVzdGFmYXl1c2VmIiwiYSI6ImNreWNrdW52ODBueHgyenFvN2s1ODlibHcifQ.qR0oZfAp3q6ojJ98ZPAMdw",
//               "id": "mapbox.mapbox-streets-v8"
//             },
//             attributionBuilder: (_) {
//               return Text("© OpenStreetMap contributors");
//             },
//           ),
//           Obx(() => MarkerLayerOptions(
//                 markers: [
//                   Marker(
//                     width: 80.0,
//                     height: 80.0,
//                     point: widget.controller.position.value,
//                     builder: (ctx) => Container(
//                       child: Container(
//                           width: 50,
//                           height: 80,
//                           child: Image.asset("assets/images/delivery_man.png")),
//                     ),
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
