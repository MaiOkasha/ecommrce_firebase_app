import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommrce_firebase_app/models/app_user.dart';
import 'package:ecommrce_firebase_app/screens/firebase/storage_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'firestore_helper.dart';

class FirestoreProvider extends ChangeNotifier{

  FirestoreProvider(){
    getAllCategories();

}

  File? selectedImage ;
  List<Category>? categories;

  TextEditingController categoryNameController = TextEditingController();
  selectImage()async{
   XFile? xFile= await ImagePicker().pickImage(source:ImageSource.gallery );
   selectedImage = File(xFile!.path);
   notifyListeners();

  }




  adddNewCategory()async {
    if (selectedImage != null) {
     String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
     Category category = Category(name : categoryNameController.text,
         imageUrl : imageUrl);
    }
  }

  getAllCategories()async{
    categories = (await FirestoreHelper.firestoreHelper.getAllCategories()).cast<Category>();
    notifyListeners();

  }

  updateCategory(Category category)async{

  }


 /* addUserToFireStore(AppUser appUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(appUser.id)
        .set(appUser.toMap());
  }

  getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> docsnsh =
    await FirebaseFirestore.instance.collection("users").doc(id).get();

    return AppUser.fromMap(docsnsh.data()!);
  }*/





}