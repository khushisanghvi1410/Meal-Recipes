import 'package:flutter/material.dart';
import 'package:meals_recipe/models/meals_detail.dart';
import '../newwidgets/meal_card.dart';
class favouritescreen extends StatelessWidget {
    List<mealsDetail> favouritemeals;
    favouritescreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    
    return 
          ListView.builder(
          itemCount: favouritemeals.length,
          itemBuilder: (context, index) {
            return MealsCard(
                imageUrl: favouritemeals[index].imageUrl,
                affordability: favouritemeals[index].affordability,
                complexity: favouritemeals[index].complexity,
                title: favouritemeals[index].title,
                duration: favouritemeals[index].duration,
                id: favouritemeals[index].id,
                ingrediants: favouritemeals[index].ingredients,
                steps: favouritemeals[index].steps);
          },
        );
    }
   
  }
