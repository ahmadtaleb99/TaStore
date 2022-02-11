import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/logic/controller/MainController.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
  }
}