

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
