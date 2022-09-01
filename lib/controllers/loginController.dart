import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/main.dart';
import 'package:labtolab_app/methods/alerts.dart';
import 'package:labtolab_app/methods/getString.dart';
import 'package:labtolab_app/methods/methods.dart';
import 'package:labtolab_app/methods/phoneId.dart';
import 'package:labtolab_app/repostary/mainRepostary.dart';
import 'package:labtolab_app/ui/customWidget/popLoading.dart';
import 'package:labtolab_app/ui/mainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController? phoneController;
  TextEditingController? passwordTextController;
  var isPassHide = true.obs;
  var isPassHideReg = true.obs;
  var isLoading = false.obs;
  var noNetFlage = false.obs;

  TextEditingController? nameTextController;
  TextEditingController? phoneRegController;
  TextEditingController? passwordRegTextController;
  // TextEditingController? emailController;
  var selectedcity = "".obs;
  var selectedProv = Map<String, List<String>>().obs;
  // var profile = ProfileModel().obs;
  var needLogin = false.obs;

  late MainRepostary repo;

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordTextController = TextEditingController();
    nameTextController = TextEditingController();
    phoneRegController = TextEditingController();
    passwordRegTextController = TextEditingController();
    // emailController = TextEditingController();

    needLogin.value = false;

    repo = MainRepostary();
    // getProfile();
    super.onInit();
  }

  Future<void> loginRequest() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      var playerId = await getId();
      print("player id .. .. .. ...... .. . .... ... . ..   ");
      print(playerId);
      final login = await repo.Login(phoneController!.text.toString(),
          passwordTextController!.text.toString(), playerId);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', login.token);
      await prefs.setString('role', login.role);
      await prefs.setString('userName', login.userName);
      await prefs.setString('labName', login.LabName);

      String token = await prefs.getString('token')!;

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();

      // Get.delete<ItemDetailsController>();

      Get.delete<LoginController>();
      Get.off(Main(0));
      // Get.dialog(null);
      showSnake("تم تسجيل الدخول بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet());
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  // Future<void> regesterRequest() async {
  //   Get.dialog(popUpLoading(), barrierDismissible: false);
  //   try {
  //     // var playerId = await getuserId();
  //     final login = await repo.Regester(
  //         nameTextController!.text.toString(),
  //         phoneRegController!.text.toString().changeToEngilish(),
  //         passwordRegTextController!.text.toString(),
  //         "null");

  //     Get.back();

  //     Get.offAll(LoginScreen());
  //     nameTextController!.clear();
  //     phoneRegController!.clear();

  //     passwordRegTextController!.clear();
  //     // selectedProv.value = null;
  //     // selectedcity.value = null;

  //     Get.snackbar("تم انشاء حساب بنجاح", "تم انشاء حساب بنجاح",
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   } on SocketException catch (_) {
  //     Get.back();
  //     showSnake(noNet);
  //   } catch (_) {
  //     Get.back();
  //     Get.snackbar(_.toString(), _.toString(),
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   }
  // }

  // Future<void> getProfile() async {
  //   needLogin.value = false;
  //   isLoading.value = true;
  //   noNetFlage.value = false;
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');

  //     print(token);
  //     if (token == null) {
  //       needLogin.value = true;
  //     } else {
  //       final login = await repo.getProfile(token);
  //       await prefs.setString('name', login.data!.profile!.name!);
  //       await prefs.setString('phone', login.data!.profile!.phone!);
  //       await prefs.setString('prov', login.data!.profile!.government!);
  //       await prefs.setString('city', login.data!.profile!.city!);
  //       await prefs.setString('email', login.data!.profile!.email!);

  //       profile.value = login;
  //     }
  //     // var playerId = await getuserId();
  //     isLoading.value = false;
  //   } on SocketException catch (_) {
  //     noNetFlage.value = true;

  //     isLoading.value = false;

  //     Get.snackbar(noNet, noNet,
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   } catch (_) {
  //     isLoading.value = false;

  //     Get.snackbar(_.toString(), _.toString(),
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   }
  // }
}
