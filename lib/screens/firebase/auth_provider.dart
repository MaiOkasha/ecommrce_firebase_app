
import 'package:ecommrce_firebase_app/models/app_user.dart';
import 'package:ecommrce_firebase_app/router.dart';
import 'package:ecommrce_firebase_app/screens/app/home_screen.dart';
import 'package:ecommrce_firebase_app/screens/firebase/auth_helper.dart';
import 'package:ecommrce_firebase_app/screens/firebase/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier{
  GlobalKey<FormState>loginKey=GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();



  nullValidation(String v){
    if(v==null|| v.isEmpty){
      return 'هذا الحقل مطلوب';

    }}
  emailValidation(String value){
    if(!isEmail(value)){
      return 'صيغة الايميل خاطئة';
    }
  }
  passwordValidation(String value){
    if(value.length<6){
      return 'يجب أن تكون 6 أحرف فأكثر';
    }
  }

  signIn()async{
    if(loginKey.currentState!.validate()){
      UserCredential? credentials =await AuthHelper.authHelper.signIn(emailController.text, passwordController.text);
      if(credentials!= null){
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
      }


    }
  }
  register()async{
    UserCredential? userCredential = await
    AuthHelper.authHelper.signUp(emailController.text, passwordController.text);
    AppUser appUser = AppUser(
        city : cityController.text,
        email : emailController.text,
        name : userNameController.text,
        id : userCredential!.user!.uid,
        phone: phoneController.text
    );
  FirestoreHelper.firestoreHelper.addUserToFireStore(appUser);

  }

  checkUser(){
    AuthHelper.authHelper.checkUser();
  }

  signOut(){
    AuthHelper.authHelper.signOut();
  }


}

