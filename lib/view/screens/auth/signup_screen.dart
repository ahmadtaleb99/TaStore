import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/FormValidation.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/auth/AuthButton.dart';
import 'package:taa_store/view/widgets/auth/AuthTextFromField.dart';
import 'package:taa_store/view/widgets/CheckWidget.dart';
import 'package:taa_store/view/widgets/ContainerUnder.dart';
import 'package:taa_store/view/widgets/text_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class SignUpScreen extends GetView<AuthController> with FormValidation {
  SignUpScreen({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  final controller=Get.find();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'Arabic','locale': Locale('ar','SY')},
  ];


  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(

                  children: [
              Column(
                    children : [Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25, top: 40),
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
                                  SizedBox(width: 50.w,),
                                  ElevatedButton(onPressed: (){
                                    buildLanguageDialog(context);
                                  }, child: Text('Lang'))

                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              AuthTextFromField(
                                controller: namecontroller,
                                obscureText: false,
                                prefixIcon: Image.asset('assets/images/user.png'),
                                hintText: 'username'.tr,
                                validator: (name){
                                  if(!isValidUser(name) || name == null){
                                    Get.snackbar('user', 'user is not  valid');
                                  }


                                }
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AuthTextFromField(
                                controller: emailController,
                                obscureText: false,
                                prefixIcon: Image.asset('assets/images/email.png'),
                                hintText: 'email'.tr,


                                validator: (email){
                                  if(!isValidEmail(email)){
                                    return('mail error');
                                  }



                              },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            GetBuilder<AuthController>(builder: (_)=>   AuthTextFromField(

                              suffexIcon: IconButton(
                                splashColor: Colors.transparent,
                                onPressed: (){
                                  controller.togglePasswordVisibility();
                                },
                                icon: controller.isPasswordVisible ?  Icon(Icons.visibility_off) :  Icon(Icons.visibility),
                              ),
                              controller: passwordController,
                              obscureText:  controller.isPasswordVisible ,
                              prefixIcon: Image.asset('assets/images/lock.png'),
                              hintText: 'password'.tr,validator: (password){
                              if(!isValidPassword(password))
                                return 'password must have 8 chars  and one number';

                            },

                            ))
                            ,
                              SizedBox(
                                height: 20.h,
                              ),
                              AuthTextFromField(

                                controller: confirmPasswordController,
                                obscureText: true,
                                prefixIcon: Image.asset('assets/images/lock.png'),
                                hintText: 'passwordmatch'.tr,validator: (password){
                                if(confirmPasswordController.text != passwordController.text)
                                  return 'passwords don\'t match';

                              },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AuthButton(onPressed: (){
                                print(controller.selectedDate);
                                controller.chooseDate();

                              }, text: 'choosedate'.tr),
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
                          SizedBox(width: 5.w,)
                          ,
                          TextUtils(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      text: 'terms And Conditions'.tr,
                                      color: Colors.black,
                                      underLine: TextDecoration.underline),

                                ],
                              ),
                              SizedBox(height: 50.h,),
                             GetBuilder<AuthController>(builder: (_) => AuthButton(onPressed: (){
                               if (formGlobalKey.currentState!.validate()) {
                                 if(!controller.isAcceptCheck){
                                   Get.snackbar('Accep!', 'Accept the terms');
                                   return;

                                 }

                                controller.signUpUsingFireBase(name: namecontroller.text, email: emailController.text,
                                    password: passwordController.text);
                                 formGlobalKey.currentState!.save();
                                 // use the email provided here
                               }
                             }, text: 'signup'.tr)),
                              SizedBox(height: 10.h,),


                            ],

                          ),
                        ),

                      ),
                    ),





                  ]
                ),
                  ],
              ),
            ),
            ContainerUnder(text: 'haveacc'.tr, textButton: 'login'.tr,
                onPressed: (){
              Get.offNamed(Routes.loginScreen);
                }
            )
          ],
        ));
  }
}
