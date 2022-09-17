import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommrce_firebase_app/models/app_user.dart';
import 'package:flutter/foundation.dart';
import 'package:ecommrce_firebase_app/models/category.dart';
//import 'package:flutter/src/foundation/annotations.dart';

class FirestoreHelper{

  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> categoriesCollectionReference = FirebaseFirestore.instance.collection('categories');
  final String catagoryName   = 'catagories';

  addUserToFireStore(AppUser appUser)async{
    await firestoreInstance.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFirestore(String id)async{

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await firestoreInstance.collection('users').doc(id).get();
    return AppUser.fromMaP(documentSnapshot.data()!);

  }
  
  addNewCategory(Category category) async {
  await  categoriesCollectionReference.add(category.toMap());
    
    
    
  }

  Future<List<Category>>getAllCategories()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await  categoriesCollectionReference.get();

    List<Category> categories = querySnapshot.docs.map((e) {

      Category category  =  Category.fromMap(e.data());
      category.catId = e.id;
      return category;
    }).toList();
    return categories;


  }

  deleteCategory(Category category)async{
   await categoriesCollectionReference.doc(category.catId).delete();

  }
  
  updateCategory(Category category)async{
   await categoriesCollectionReference.doc(category.catId).update(category.toMap());
  }








}