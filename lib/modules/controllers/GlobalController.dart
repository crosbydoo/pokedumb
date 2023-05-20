// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  TextEditingController textController = TextEditingController();
  var name = ''.obs;
  @override
  void onInit() {
    super.onInit();
    // Tambahkan listener pada textController
    textController.addListener(() {
      name.value = textController.text.toLowerCase();
    });
  }
}
