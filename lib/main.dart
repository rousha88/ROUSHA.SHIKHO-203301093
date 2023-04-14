import 'package:flutter/material.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:flutter_application_2/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Star Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}

 
