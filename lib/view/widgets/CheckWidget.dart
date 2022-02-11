import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AuthController>(builder: (_) =>InkWell(
      onTap: (){
        controller.toggleAcceptCheck();
      },
      child: Container(
          width: 20.w,
          height: 20.h,

          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: controller.isAcceptCheck ?  Image.asset('assets/images/check.png',fit: BoxFit.cover,) : Container()

      ),
    ));
  }
}
