import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AuthButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        
        minimumSize: (Size(360.h,50.w))
      ),
        onPressed: onPressed,
        child: TextUtils(
          fontSize: 18,
          underLine: TextDecoration.none,
          text: text,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ));
  }
}
