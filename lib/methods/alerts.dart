import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getString.dart';

showSnake(String text) {
  Get.snackbar(getTranslate(text), getTranslate(text),
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.info,
        color: Get.theme.primaryColorDark,
      ),
      colorText: Colors.black,
      backgroundColor: Colors.white.withOpacity(0.9));
}
