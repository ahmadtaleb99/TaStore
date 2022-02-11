import 'package:get/get.dart';

class LocaleString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {

    'en_US':{
      'username':'user',
      'email':'email',
      'password':'password',
      'passwordmatch':'Confirm Password',
      'haveacc':'already have an account?',
      'choosedate':'choose Date',
        'signup':'Sign Up',
        'login':'login',
        'I Accept':'I Accept',
      'terms And Conditions':'terms And Conditions'

},


    'ar_SY':{
      'username':'اسم المستخدم',
      'email':'البريد الالكتروني',
      'password':'كلمة المرور',
      'passwordmatch':'تأكيد كلمة المرور',
      'haveacc':'لديك حساب سابق؟',
      'choosedate':'اختر تاريخ',
      'signup':'تسجيل حساب',
      'login':'تسجيل دخول',
  'terms And Conditions':' على الشروط و المعايير',
      'I Accept':'أنا أوافق',

    },

  };

}