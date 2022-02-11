import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/utils/theme.dart';

import '../text_utils.dart';

class CartCheckOut extends StatelessWidget {
   CartCheckOut({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    text: 'Total',
                    color: Colors.grey),
                TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: '\$ ${cartController.totalPrice.toStringAsFixed(2)}',
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 60.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          text: 'Check Out',
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      SizedBox(width: 10.w,),
                      Icon(Icons.shopping_cart,   color: Get.isDarkMode ? Colors.white : Colors.black)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
