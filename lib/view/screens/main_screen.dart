import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/logic/controller/MainController.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final Authcontroller = Get.find<AuthController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    int currentIndex = controller.currentIndex.value;
    return Obx(() => SafeArea(
            child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(
                '${controller.titles[controller.currentIndex.value]} : ${Authcontroller.displayName}'),
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            centerTitle: true,
            actions: [
              GetBuilder<CartController>(builder: (_) {
                return !cartController.cartItems.isEmpty ? Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  badgeContent: Text(
                    cartController.cartItems.length.toString(),
                    style: TextStyle(
                        color : Colors.white  ),
                  ),
                  toAnimate: true,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: Duration(milliseconds: 500),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Image.asset('assets/images/shop.png')),
                ) :  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: Image.asset('assets/images/shop.png'));
              })
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.pages,
          ),
        )));
  }
}
