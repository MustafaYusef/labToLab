import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contx extends GetxController {
  var role = "".obs;
  @override
  void onInit() {
    getRole();
    super.onInit();
  }

  void getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? rol = prefs.getString('role');
    role.value = rol == null ? "" : rol;
    // setState(() {});
  }
}
