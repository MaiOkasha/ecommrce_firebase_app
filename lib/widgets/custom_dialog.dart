
import 'package:flutter/material.dart';
import '../router.dart';


class CustomDialog{
  static showDialogFunction(String content){
    showDialog(context: AppRouter.navKey.currentContext!, builder: (context){
      return AlertDialog(
        content: Text(content),
        actions: [
          TextButton(onPressed: (){
            AppRouter.popRoute();
          }, child: Text('Ok'))
        ],
      );
    });



  }
}