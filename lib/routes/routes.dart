import 'package:flutter_application_2/logic/bindings/main_binding.dart';
import 'package:flutter_application_2/view/screens/auth/forgot_password_screen.dart';
import 'package:flutter_application_2/view/screens/auth/login_screen.dart';
import 'package:flutter_application_2/view/screens/auth/signup_screen.dart';
import 'package:flutter_application_2/view/screens/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/bindings/auth_biniding.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.WelcomeScreen;

  //getPages:

  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
      binding: AuthBiniding(),
    ),
    GetPage(
      name: Routes.SignUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBiniding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => forgotPasswordScreen(),
      binding: AuthBiniding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () =>  mainSecreen(),
      bindings: [
        AuthBiniding(),
        MainBinding(),
        ],
    ),
  ];
}

class Routes {
  static const WelcomeScreen = '/welcomeScreen';
  static const LoginScreen = '/loginScreen';
  static const SignUpScreen = '/SignUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}
