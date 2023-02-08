import 'package:flutter/material.dart';
import 'package:meals_recipe/newwidgets/meal_card.dart';
import '../models/meals_detail.dart';


class Meals extends StatefulWidget {
  //  String title;
  //  String id;
 final List<mealsDetail> availablemeals;
  Meals(
    this.availablemeals
      );

  @override
  State<Meals> createState() => _MealsState();
}
var categoriesmeal;
class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['name'];
    final categoryid = routeArgs['id'];
  
      
     categoriesmeal = widget.availablemeals.where(
        (isthere) {return isthere.categories.contains(categoryid); }).toList();

        print(categoriesmeal);
        
    

    return Scaffold(
        appBar: AppBar(
          title: Text(title.toString()),
        ),
        body: ListView.builder(
          itemCount: categoriesmeal.length,
          itemBuilder: (context, index) {
            return MealsCard(
                imageUrl: categoriesmeal[index].imageUrl,
                affordability: categoriesmeal[index].affordability,
                complexity: categoriesmeal[index].complexity,
                title: categoriesmeal[index].title,
                duration: categoriesmeal[index].duration,
                id: categoriesmeal[index].id,
                ingrediants: categoriesmeal[index].ingredients,
                steps: categoriesmeal[index].steps);
          },
        ));
  }
}
