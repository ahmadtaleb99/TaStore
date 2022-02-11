
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/home/BuildCardItems.dart';
import 'package:taa_store/view/widgets/home/SearchTextField.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          crossAxisAlignment:  CrossAxisAlignment.start
          ,children: [
            Container(
              width: double.infinity,
              height: 210.h,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight:Radius.circular(20) ,bottomLeft: Radius.circular(20)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(fontSize: 25.sp, fontWeight: FontWeight.bold, text: 'find Your', color: Colors.white),
                    SizedBox(height: 10.h,),
                    TextUtils(fontSize: 28.sp, fontWeight: FontWeight.bold, text: 'INSPIRATION', color: Colors.white),
                    SizedBox(height: 42.h,),
                    Container(
                      width: 309.w,
                        height: 42.h,
                        child: SearchTextField()),



                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding:  EdgeInsets.only(left: 24.w),
              child: Row(
                children: [
                  TextUtils(fontSize: 15, fontWeight: FontWeight.bold, text: 'Categories', color: Get.isDarkMode ? Colors.white : Colors.black),
                ],
              ),
            ),
            BuildCardItems()
          ],
        ),
      ),
    );
  }
}
