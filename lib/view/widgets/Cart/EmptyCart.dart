import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,size:150.h),
          SizedBox(height: 50.h,),
          RichText(text: TextSpan(
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(text: 'Your Cart Is',style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
              TextSpan(text: '  Empty',style: TextStyle(color: Get.isDarkMode ? pinkClr : mainColor)),
            ]
          ),),
          SizedBox(height: 40.h,),
          Container(
            height: 50.h,
            width: 200.w,
            child: ElevatedButton(onPressed: (){
              Get.offNamed(Routes.mainScreen);
            },
                style: ElevatedButton.styleFrom(

                  primary: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: Text('Go Home',style: TextStyle(fontSize: 20.sp
                ),)
            ),
          )
        ],
      ),
    );
  }
}
