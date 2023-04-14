import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/screens/auth/category_screen.dart';
import 'package:flutter_application_2/view/screens/auth/favorites_screen.dart';
import 'package:flutter_application_2/view/screens/auth/home_screen.dart';
import 'package:flutter_application_2/view/screens/auth/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final Tabs = [
    HomeScreen(),
    FavoritesScreen(),
    CategoerScreen(),
    SettingsScreen(),
  ].obs;
  final title = [
    "Star SHOP",
    "Category",
    "Favorites",
    "Setting",
  ];
}
