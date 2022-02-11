import 'package:get/get.dart';
import 'package:taa_store/logic/binding/AuthBinding.dart';
import 'package:taa_store/logic/binding/MainBinding.dart';
import 'package:taa_store/logic/binding/ProductsBinding.dart';
import 'package:taa_store/logic/controller/MainController.dart';
import 'package:taa_store/view/screens/auth/forget_password_screen.dart';
import 'package:taa_store/view/screens/auth/signup_screen.dart';
import 'package:taa_store/view/screens/auth/login_screen.dart';
import 'package:taa_store/view/screens/cart_screen.dart';
import 'package:taa_store/view/screens/main_screen.dart';
import 'package:taa_store/view/screens/welcome_screen.dart';

class AppRoutes {

  static final routes = [
    GetPage (name: Routes.welcomeScreen , page: () => WelcomeScreen() ),
    GetPage (name: Routes.cartScreen , page: () => CartScreen() ,bindings: [
      ProductBinding(),
    ]),

    GetPage (name: Routes.mainScreen , page: () => MainScreen(), bindings: [
      MainBinding(),
      AuthBinding(),
      ProductBinding()
    ] ),

    GetPage (name: Routes.loginScreen , page: () => LoginScreen() ,binding: AuthBinding()),
    GetPage (name: Routes.signUpScreen , page: () => SignUpScreen() ,binding: AuthBinding()),
    GetPage (name: Routes.forgotPasswordScreen , page: () => ForgetPasswordScreen() ,binding: AuthBinding()),
    ];

}

class Routes {


  static const String loginScreen = '/LoginScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String signUpScreen = '/SignUpScreen';
  static const String forgotPasswordScreen = '/ForgotPasswordScreen';
  // static const String  = '/ForgotPasswordScreen';
  static const String mainScreen = '/MainScreen';
  static const String cartScreen = '/CartScreen';
}