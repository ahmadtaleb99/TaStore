import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/FormValidation.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/CheckWidget.dart';
import 'package:taa_store/view/widgets/ContainerUnder.dart';
import 'package:taa_store/view/widgets/auth/AuthButton.dart';
import 'package:taa_store/view/widgets/auth/AuthTextFromField.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget with FormValidation {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = 'ahmad@test.com';
    passwordController.text = 'a123123123';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('LOG IN'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 25, left: 25, top: 40),
                        child: Form(
                          key: formGlobalKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextUtils(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      text: 'Sign',
                                      color: mainColor,
                                      underLine: TextDecoration.none),
                                  TextUtils(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      text: 'Up',
                                      color: Colors.black,
                                      underLine: TextDecoration.none),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('Lang'))
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AuthTextFromField(
                                controller: emailController,
                                obscureText: false,
                                prefixIcon:
                                    Image.asset('assets/images/email.png'),
                                hintText: 'email'.tr,
                                validator: (email) {
                                  if (!isValidEmail(email)) {
                                    Get.snackbar('email', 'email isnt  valid');
                                  }
                                }
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GetBuilder<AuthController>(
                                  builder: (_) => AuthTextFromField(
                                        suffexIcon: IconButton(
                                          splashColor: Colors.transparent,
                                          onPressed: () {
                                            controller
                                                .togglePasswordVisibility();
                                          },
                                          icon: controller.isPasswordVisible
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                        ),
                                        controller: passwordController,
                                        obscureText:
                                            controller.isPasswordVisible,
                                        prefixIcon: Image.asset(
                                            'assets/images/lock.png'),
                                        hintText: 'password'.tr,
                                        validator: (password) {
                                          if (!isValidPassword(password))
                                            return 'password must have 8 chars  and one number';
                                        },
                                      )),
                              InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.forgotPasswordScreen);
                                  },
                                  child: TextUtils(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      text: 'Forget Password?',
                                      color: Colors.black,
                                      underLine: TextDecoration.none)),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                children: [
                                  CheckWidget(),
                                  TextUtils(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      text: 'I Accept'.tr,
                                      color: Colors.black,
                                      underLine: TextDecoration.none),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextUtils(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      text: 'terms And Conditions'.tr,
                                      color: Colors.black,
                                      underLine: TextDecoration.underline),
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                        GetBuilder<AuthController>(builder: (_) => AuthButton(onPressed: (){
                          if (formGlobalKey.currentState!.validate()) {
                            if(!controller.isAcceptCheck){
                              Get.snackbar('Accep!', 'Accept the terms');
                              return;

                            }

                            controller.signInUsingFireBase(email: emailController.text, password: passwordController.text);
                            formGlobalKey.currentState!.save();
                            // use the email provided here
                          }
                        }, text: 'Log in'.tr)),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text('or'),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<AuthController>(builder: (_){
                                    return InkWell(
                                      onTap: (){
                                        controller.signInUsingFacebook();
                                      },
                                        child: Image.asset(
                                            'assets/images/facebook.png'));
                                  }),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GetBuilder<AuthController>(builder: (_){
                                    return InkWell(
                                        onTap: (){
                                        controller.signInUsingGoogle();
                                        },
                                        child: Image.asset(
                                            'assets/images/google.png'));
                                  })
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            ContainerUnder(
                text: 'donthave'.tr,
                textButton: 'signup'.tr,
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                })
          ],
        ));
  }
}
