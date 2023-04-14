import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/controller/auth_controller.dart';
import 'package:flutter_application_2/utils/theme.dart';
import 'package:flutter_application_2/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode ? Image.asset('assets/images/check.png')
                   :const Icon(
                    Icons.done,
                    color: pinkClr,)
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'I accept ',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'terms & conditions',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}
