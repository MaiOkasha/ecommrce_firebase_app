

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  late Category category;
  CategoryWidget(this.category);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(category.imageUrl),
          Text(category.name)
        ],
      ),
    );
  }
}
