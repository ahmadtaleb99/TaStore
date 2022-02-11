




import 'package:get/get.dart';
import 'package:taa_store/view/screens/category_screen.dart';
import 'package:taa_store/view/screens/favourite_screen.dart';
import 'package:taa_store/view/screens/home_screen.dart';
import 'package:taa_store/view/screens/settings_screen.dart';

class MainController extends GetxController{

  RxInt currentIndex =  0.obs;


  final pages = [
    HomeScreen(),
    CategoryScreeen(),
    FavoriteScreeen(),
    SettingsScreen(),
  ].obs;

  final titles =  [
    'Home Screen',
    'Category Screeen',
    'Favorite Screeen',
    'Settings Screen'
  ].obs ;
}