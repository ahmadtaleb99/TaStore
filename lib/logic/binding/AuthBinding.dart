import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
      Get.put(AuthController());
  }
}