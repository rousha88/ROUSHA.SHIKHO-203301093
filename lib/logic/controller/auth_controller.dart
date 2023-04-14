import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
}
