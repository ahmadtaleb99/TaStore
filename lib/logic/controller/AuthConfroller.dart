import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taa_store/model/FacebookModel.dart';
import 'package:taa_store/routes/route.dart';

class AuthController extends GetxController {

  var selectedDate = DateTime.now().obs;
  bool isPasswordVisible = false;
  bool isAcceptCheck = false;
  String displayName = '';
  String displayPhoto = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookAuth facebookAuth = FacebookAuth.instance;
  late Facebook facebookModel;

  final authBox = GetStorage();
  bool isSignedin = false ;





  Future<void> signUpUsingFireBase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(displayName);
      });
      isSignedin  =true;
      authBox.write('isSignedIN', isSignedin);

      update();
    } on FirebaseAuthException catch (error) {
      String? msg = error.message;
      Get.snackbar(error.code.replaceAll(RegExp('-'), ' '),
          msg!.replaceAll(RegExp('-'), ' '),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  Future<void> signInUsingFireBase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {displayName = auth.currentUser!.displayName!});

      isSignedin  =true;
      authBox.write('isSignedIN', isSignedin);
      update();
      Get.offNamed(Routes.mainScreen, arguments: displayName);
    } on FirebaseAuthException catch (error) {
      String? msg = error.message;
      Get.snackbar(error.code.replaceAll(RegExp('-'), ' '),
          msg!.replaceAll(RegExp('-'), ' '),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();

      Get.back();
      Get.snackbar('reset!', 'email has been sent to $email');

    } on FirebaseAuthException catch (error) {
      String? msg = error.message;
      Get.snackbar(error.code.replaceAll(RegExp('-'), ' '),
          msg!.replaceAll(RegExp('-'), ' '),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }


  void signOutFromApp() async {
        authBox.write('isSignedIN', isSignedin);
    try{
      await  auth.signOut();
      await  facebookAuth.logOut();
      await  googleSignIn.signOut();
      displayName ='';
      displayPhoto ='';
      update();
      Get.offNamed(Routes.welcomeScreen);
    }
    catch (error){
      Get.snackbar('Error!', error.toString());
      print(error.toString());

    }
  }

  void signInUsingGoogle() async{
      try{
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        displayName = googleUser!.displayName!;
        displayPhoto = googleUser.photoUrl!;
        isSignedin  =true;
        authBox.write('isSignedIN', isSignedin);
        update();
      }
      catch (error){
        Get.snackbar('Error!', error.toString());
        print(error.toString());

      }

  }


  Future<void> signInUsingFacebook() async {
    try{
      LoginResult loginResult = await facebookAuth.login();

      print('acces sssssssssssss ${loginResult.accessToken}');


      final OAuthCredential facebookAuthCredential =

      FacebookAuthProvider.credential(loginResult.accessToken!.token);

      var data = await facebookAuth.getUserData();
      print('acces sssssssssssss ${loginResult.accessToken}');
      facebookModel = Facebook.fromJson(data);
      displayName = facebookModel.name;
      isSignedin  =true;
      authBox.write('isSignedIN', isSignedin);

      update();
      Get.offNamed(Routes.mainScreen,arguments: displayName);
    }
    catch (e){
      print(e.toString());
    }
    // if(loginResult.status==LoginStatus.success){


    // }


  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleAcceptCheck() {
    isAcceptCheck = !isAcceptCheck;
    update();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime(2007, 12, 31),
        firstDate: DateTime(1999),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select age',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if (day.isBefore(DateTime(2008)))
      return true;
    else
      return false;
  }



}
