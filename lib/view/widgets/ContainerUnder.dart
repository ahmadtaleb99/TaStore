import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textButton;
  final Function() onPressed;
  const ContainerUnder({Key? key, required this.text, required this.textButton, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100.h,
      decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10), topRight: const Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: text,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(onPressed: onPressed, child:  TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: textButton,
              color: Colors.white,
              underLine: TextDecoration.underline),)
        ],
      ),
    );
  }
}
