import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taa_store/Translations/Localization.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/logic/ThemeLogic.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/screens/welcome_screen.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: false,
        builder: (context) => ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          theme: ThemesApp.light,
          darkTheme: ThemesApp.dark,
          themeMode: ThemeLogic().themeMode,
          // theme: ThemeData.light(),
          // darkTheme: ThemeData.dark(),
          translations: LocaleString(),
          locale: DevicePreview.locale(context),
          initialRoute:  Routes.mainScreen,//FirebaseAuth.instance.currentUser != null || AuthController().authBox.read('isSignedIN') ? Routes.mainScreen : Routes.welcomeScreen ,
          getPages: AppRoutes.routes,

        );
      },

    ));
  }
}

