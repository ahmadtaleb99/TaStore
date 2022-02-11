import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/logic/ThemeLogic.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        TextButton(
          onPressed: () {
            ThemeLogic().changeTheme();
          },
          child: Text('change theme'),
        ),
        GetBuilder<AuthController>(
            builder: (controller) => TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Log Out',
                        middleText: 'Are you sure you want to log out ?',
                        textConfirm: 'yes',
                        textCancel: 'no',
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          controller.signOutFromApp();
                        });
                  },
                  child: Text('Log Out'),
                ))
      ],
    )));
  }
}
