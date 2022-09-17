import 'package:ecommrce_firebase_app/screens/firebase/auth_helper.dart';
import 'package:ecommrce_firebase_app/screens/firebase/auth_provider.dart';
import 'package:ecommrce_firebase_app/screens/firebase/firestore_helper.dart';
import 'package:ecommrce_firebase_app/screens/firebase/firestore_provider.dart';
import 'package:ecommrce_firebase_app/widgets/custom_textfeild.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomTextfield(),
            CustomTextfield(),
            CustomTextfield(),
            CustomTextfield(),
            CustomTextfield(),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  AuthHelper.authHelper.signUp('maiokasha@gmail.com','123456');
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
