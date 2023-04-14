import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/controller/main_controller.dart';
import 'package:flutter_application_2/utils/theme.dart';
import 'package:get/get.dart';

class mainSecreen extends StatelessWidget {
  mainSecreen({Key? key}) : super(key: key);

  final conrtoller = Get.find<MainController>();
  final formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
           elevation: 0,
           leading: Container(),
             
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/shop.png'),
                
              ),
              
            ],
            backgroundColor: mainColor,
            title: Text(conrtoller.title[conrtoller.currentIndex.value]),
            centerTitle: true,
          ),
          
             
          
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            currentIndex: conrtoller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              conrtoller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: conrtoller.currentIndex.value,
            children: conrtoller.Tabs.value,
          ),
        );
       }
      ),
    );
  }
}
