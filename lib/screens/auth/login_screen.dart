import 'package:ecommrce_firebase_app/widgets/custom_textfeild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();

    //TODO: Init TapGesture
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navigateToRegister;
    // _tapGestureRecognizer.onTap = _navigateToRegister;
  }

  void _navigateToRegister() =>
      Navigator.pushNamed(context, '/register_screen');

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: provider.loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  'Enter email & password',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
                CustomTextfield(
                  validator: provider.emailValidation,
                  controller: provider.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextfield(
                    validator: provider.passwordValidation,
                    controller: provider.passwordController,
                    textInputType: TextInputType.text),
                const SizedBox(height: 15),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    provider.signIn();
                  },
                  child: const Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Don\'t have an account',
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          recognizer: _tapGestureRecognizer,
                          text: 'Create Now!',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

/*void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }*/

/*bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      controlErrorText();
      return true;
    } else {
      controlErrorText();
    }*/
// ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(
//     content: Text('Enter required data!'),
//     backgroundColor: Colors.red,
//     behavior: SnackBarBehavior.floating,
//   ),
// );

/* return false;
  }

  void controlErrorText() {
    setState(() {
      _emailErrorText =
      _emailTextController.text.isEmpty ? 'Enter email' : null;
      _passwordErrorText =
      _passwordTextController.text.isEmpty ? 'Enter password' : null;
    });
  }

  void _login() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logged in successfully'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    ).closed.then((value) => Navigator.pushReplacementNamed(context, '/main_screen'));
  }*/
}
