import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/controller/auth_controller.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:flutter_application_2/utils/my_string.dart';
import 'package:flutter_application_2/utils/theme.dart';
import 'package:flutter_application_2/view/widgets/text_utils.dart';
import 'package:get/get.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import 'auth_button.dart';
import 'check_widget.dart';
import 'container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key ? key}) :super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "SIGN",
                            color:   mainColor,
                          
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "UP",
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      AuthTextFromField(
                        controller: nameController,
                        obscureText: false,
                        validator: (Value) {
                          if (Value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(Value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/user.png')
                            : const Icon(
                                Icons.person,
                                color: mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (Value) {
                          if (!RegExp(validationEmail).hasMatch(Value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/email.png')
                            : const Icon(
                                Icons.email,
                                color: mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFromField(
                          controller: passwordController,
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/lock.png')
                              : const Icon(
                                  Icons.lock,
                                  color: mainColor,
                                  size: 30,
                                ),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibilty();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )),
                        );
                      }),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        onPressed: () {},
                        text: 'SIGN UP',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: 'Already have an Account?',
              textType: ' Log in',
              onPressed: () {
                Get.offNamed(Routes.LoginScreen);
              },
            ),
          ],
        )),
      ),
    );
  }
}
