import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeLogic {

  static const themeKey = 'isDarkMode';
  final GetStorage box = GetStorage() ;

  ThemeMode  get themeMode => readThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void saveThemeToBox(bool isDark){
    box.write(themeKey, isDark);
  }
  bool readThemeFromBox(){
    return box.read<bool>(themeKey) ?? false ;
  }

  void changeTheme(){
      readThemeFromBox() ? Get.changeThemeMode(ThemeMode.light)  : Get.changeThemeMode(ThemeMode.dark);
      saveThemeToBox(!readThemeFromBox());
  }

}