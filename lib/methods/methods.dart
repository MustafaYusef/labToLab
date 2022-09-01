import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:labtolab_app/controllers/cont.dart';
import 'package:labtolab_app/controllers/favouriteController.dart';
import 'package:labtolab_app/controllers/mainController.dart';
import 'package:labtolab_app/controllers/mainLabOrderController.dart';
import 'package:labtolab_app/controllers/orderController.dart';
import 'package:labtolab_app/ui/auth/loginScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

List<String> convertToString(String s) {
  List<String> list =
      s.substring(1, s.length - 1).split(",").map((e) => e).toList();
  return list;
}

List<int> convertToInt(String s) {
  List<int> list =
      s.substring(1, s.length - 1).split(",").map((e) => int.parse(e)).toList();
  return list;
}

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}

Future<Uint8List> getBytesFromAsset({String? path, int? width}) async {
  ByteData data = await rootBundle.load(path!);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  Get.to(LoginScreen());
  Get.delete<MainController>();
  Get.delete<MainLabOrdersController>();
  Get.delete<OrdersController>();

  Get.delete<Contx>();

  // Get.delete<FavouriteController>();
}
// Future<String?> getuserId() async {
//   String? playerId;
//   final status = await OneSignal.shared.getDeviceState();
//   playerId = status!.userId;
//   // try {
//   //   OneSignal.shared.getDeviceState().then((deviceState) {
//   //     playerId = deviceState.userId;
//   //     print("OneSignal: device state: ${deviceState.jsonRepresentation()}");
//   //   });
//   //   // var status = await OneSignal.shared.getPermissionSubscriptionState();
//   //   // playerId = status.subscriptionStatus.userId;
//   //   print("plyer id  " + playerId.toString());
//   // } catch (_) {
//   //   print("play servicesss   one signel");
//   //   print(_.toString());
//   // }
//   print("plyer id  " + playerId.toString());
//   return playerId == null ? "null" : playerId;
// }

extension replaceArabicNumber on String {
  String changeToEngilish() {
    String output = "";
    const numberMap = {
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
      '٠': '0'
    };
    for (int i = 0; i < this.length; i++) {
      if (numberMap.containsKey(this[i])) {
        output += numberMap[this[i]]!;
      } else {
        output += this[i];
      }
    }
    if (output == "") {
      return this;
    } else {
      return output;
    }
  }
}

String? getStatus(int? status) {
  if (status == 0) {
    return getTranslate("waiting");
  } else if (status == 1) {
    return getTranslate("accept");
  } else if (status == 2) {
    return getTranslate("cancel");
  } else if (status == 3) {
    return getTranslate("done");
  }
}

// extension AddDirectionality on Widget {
//   addDirectionality() {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: this,
//     );
//   }
// }

Color getColorFromColorCode(String code) {
  return code.length < 7
      ? Colors.white
      : Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

// Future<String?> getuserId() async {
//   var status = await OneSignal.shared.getPermissionSubscriptionState();
//   var playerId = status.subscriptionStatus.userId;
//   print("plyer id  " + playerId.toString());
//   return playerId;
// }

String getTranslate(String text) {
  return text.tr();
}
