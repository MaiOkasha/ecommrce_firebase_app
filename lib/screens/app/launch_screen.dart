import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase/auth_helper.dart';

class SplashScreen extends StatelessWidget {
  navigateFun(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AuthHelper>(context,listen: false).checkUser();
  }
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Tokoto App'
        ),
      ),
    );
  }
}
