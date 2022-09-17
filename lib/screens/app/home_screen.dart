import 'dart:developer';
import 'dart:io';

import 'package:ecommrce_firebase_app/screens/firebase/auth_provider.dart';
import 'package:ecommrce_firebase_app/screens/firebase/firestore_provider.dart';
import 'package:ecommrce_firebase_app/screens/firebase/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout) )
        ],
      ),
      body:  Consumer<FirestoreProvider>(
        builder: (context,provider,x) {
          return Column(
            children: [
               provider.selectedImage==null?
                 InkWell(
                   onTap: (){
                     provider.selectImage();
                   },
                   child: CircleAvatar(
                     radius: 50,backgroundColor: Colors.green,
                   ),
                 ):

              CircleAvatar(
                backgroundImage: FileImage(provider.selectedImage!),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(controller: provider.categoryNameController,),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                provider.adddNewCategory();
              }, child: Text('New Category')),
              /*Center(
                child: RaisedButton(onPressed: (){
                  Provider.of<FirestoreProvider>(context,listen: false).inserNewCategory();
                },child: Text('Add'),),
              ),*/
              /*Center(
                child: ElevatedButton(onPressed: ()async{
                  XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
                  String url = await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
                // String url = await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
                 log(url);
                },child: Text('Image',
                style: TextStyle(
                  color: Colors.black
                ),
                ),),
              )*/
            ],
          );
        }
      ),
    );
  }
}
