import 'package:ecommrce_firebase_app/screens/firebase/firestore_provider.dart';
import 'package:ecommrce_firebase_app/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context,provider,x) {
        return
        provider.categories==null?
            const Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount: provider.categories!.length,
            itemBuilder: (context,index){
              return CategoryWidget(provider.categories![index]);
            });
      }
    );
  }
}
