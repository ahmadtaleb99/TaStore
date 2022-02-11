import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taa_store/logic/controller/AuthConfroller.dart';
import 'package:taa_store/utils/FormValidation.dart';
import 'package:taa_store/view/widgets/auth/AuthButton.dart';
import 'package:taa_store/view/widgets/auth/AuthTextFromField.dart';
import 'package:taa_store/view/widgets/text_utils.dart';
import 'package:get/get.dart';
class ForgetPasswordScreen extends StatelessWidget with FormValidation{
   ForgetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final controller= Get.find<AuthController>();

  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: ListView(
        children:[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: 'Forgot your password? don\'t your worry my dear, we got you 😘, type your email and we will send'
                        'you a link to create a new password',
                    color: Colors.black,
                    underLine: TextDecoration.none),
              ),

              SizedBox(height: 10.h,),
              Image.asset('assets/images/forgetpass copy.png',width: 300.w,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),

                child: AuthTextFromField(
                controller: emailController,
                obscureText: false,
                prefixIcon: Image.asset('assets/images/email.png'),
                hintText: 'email'.tr,


                validator: (email){
                if(isValidEmail(email)){
                Get.snackbar('email', 'email is  valid');
                }
                else return('mail error');


                },
                ),
              ),
              SizedBox(height: 20.h,),
                  GetBuilder<AuthController>(builder: (_) =>
                      AuthButton(onPressed: (){
                        controller.resetPassword(emailController.text);
                      }, text: 'Send')
                  ),
              SizedBox(height: 10.h,),

            ],
          ),
      ]
      ),
    );
  }
}
