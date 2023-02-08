import 'package:flutter/material.dart';
import 'package:meals_recipe/dummy_data/meals_list.dart';
import 'package:meals_recipe/models/meals_detail.dart';
import 'package:meals_recipe/newwidgets/griddetails.dart';
import 'package:meals_recipe/newwidgets/main_drawer.dart';
import 'package:meals_recipe/newwidgets/meal_card.dart';
import 'package:meals_recipe/screens/filterscreen.dart';
import 'package:meals_recipe/screens/meals.dart';
import 'package:meals_recipe/screens/tabs_screen.dart';
import './screens/detailedPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluteen': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<mealsDetail> _availablemeals = DUMMY_mealsDetailS;
  List<mealsDetail> favouritemeals = [];

  void setfilters(Map<String, bool> filtersdata) {
    setState(() {
      filters = filtersdata;
      _availablemeals = _availablemeals.where((meal) {
        if (filters['gluteen']! && !meal.isGlutenFree) {
          // print(filters['gluteen']);
          // print('${meal.title} khushi');
          return true;
        }
        if (filters['lactose']! && !meal.isLactoseFree == true) {
          return true;
        }
        if (filters['vegeterian']! && meal.isVegetarian == true) {
          print('${meal.title} khushi');
          return true;
        }
        if (filters['vegan']! && !meal.isVegan == true) {
          return true;
        }
        print(_availablemeals);
        return false;
      }).toList();
    });
  }
  bool isMealfavourite(String mealid){
    return favouritemeals.any((element) => element.id==mealid);
  }

  void tooglefavourite(String mealid) {
    final index =
        favouritemeals.indexWhere(((element) => element.id == mealid));
    if (index >= 0) {
      setState(() {
        favouritemeals.removeAt(index);
      });
    } else {
      setState(() {
        favouritemeals.add(
            DUMMY_mealsDetailS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        GridDetails.routename: (context) => Meals(_availablemeals),
        MealsCard.routeName: (context) => DetailedPage(tooglefavourite,isMealfavourite),
        MainDrawer.routeName: (context) => Filterscreen(setfilters),
        "/": (context) => TabsScreen(favouritemeals),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            primarySwatch: Colors.pink,
          ),
          canvasColor: Color.fromARGB(255, 236, 229, 229),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Color.fromARGB(255, 90, 6, 6), fontSize: 20),
                bodyText2: TextStyle(color: Colors.white, fontSize: 30),
              )),
    );
  }
}
