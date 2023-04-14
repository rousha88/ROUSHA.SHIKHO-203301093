import 'package:flutter_application_2/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
