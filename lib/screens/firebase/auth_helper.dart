




import 'package:ecommrce_firebase_app/router.dart';
import 'package:ecommrce_firebase_app/screens/app/home_screen.dart';
import 'package:ecommrce_firebase_app/screens/auth/login_screen.dart';
import 'package:ecommrce_firebase_app/widgets/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogFunction('No user found in this email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  checkUser() {
    User? user = firebaseAuth.currentUser;
    if (user == null) {
      AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
    } else {
      AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  }

  forgetPassword() async {}
}