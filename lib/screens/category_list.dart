import 'package:flutter/material.dart';
import '../dummy_data/category_data.dart';
import '../newwidgets/griddetails.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       
        body: GridView(
          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          padding: const EdgeInsets.all(15),
          children: category_data.map((category) {
            // print("$category khushi");
            return GridDetails(category.id, category.name, category.color);
          }).toList(),
        ));
  }
}
