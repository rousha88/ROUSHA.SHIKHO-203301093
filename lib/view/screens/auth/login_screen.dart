// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/controller/auth_controller.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:flutter_application_2/utils/my_string.dart';
import 'package:flutter_application_2/utils/theme.dart';
import 'package:flutter_application_2/view/screens/auth/auth_button.dart';
import 'package:flutter_application_2/view/screens/auth/container_under.dart';
import 'package:flutter_application_2/view/screens/auth/forgot_password_screen.dart';
import 'package:flutter_application_2/view/widgets/auth/auth_text_from_field.dart';
import 'package:flutter_application_2/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                            text: "LOG",
                            color: mainColor,
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: "IN",
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
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
                        var controller;
                        return AuthTextFromField(
                          controller: passwordController,
                          obscureText: true,
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )),
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgotPasswordScreen);
                          },
                          child: TextUtils(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              text: 'Forgot Password ?',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        onPressed: () {
                          Get.offNamed(Routes.mainScreen);
                        },
                        text: 'LOG IN',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/google.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an Account?",
              textType: ' Sign Up',
              onPressed: () {
                Get.offNamed(Routes.SignUpScreen);
              },
            ),
          ],
        )),
      ),
    );
  }
}
