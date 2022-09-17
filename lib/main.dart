import 'package:ecommrce_firebase_app/firebase_options.dart';
import 'package:ecommrce_firebase_app/screens/app/home_screen.dart';
import 'package:ecommrce_firebase_app/screens/app/launch_screen.dart';
import 'package:ecommrce_firebase_app/screens/auth/login_screen.dart';
import 'package:ecommrce_firebase_app/screens/auth/register_screen.dart';
import 'package:ecommrce_firebase_app/screens/firebase/auth_provider.dart';
import 'package:ecommrce_firebase_app/screens/firebase/firestore_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
    ChangeNotifierProvider<AuthProvider>(
    create: (context)=>AuthProvider(),),
      ChangeNotifierProvider<FirestoreProvider>(
        create: (context)=>FirestoreProvider(),),

    ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home_screen',
        routes: {
          '/login_screen': (context)=> LoginScreen(),
          '/register_screen':(context)=> RegisterScreen(),
          '/launch_screen':(context)=> SplashScreen(),
          '/home_screen' :(context)=> HomeScreen()


        },

      ),
    );
  }
}
