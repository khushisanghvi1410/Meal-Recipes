import 'package:flutter/material.dart';
import 'package:meals_recipe/models/meals_detail.dart';
import 'package:meals_recipe/newwidgets/main_drawer.dart';
import '../screens/category_list.dart';
import '../screens/favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  List<mealsDetail>favoritemeals;
  TabsScreen(this.favoritemeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

int globalvalue = 0;

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title:
                globalvalue == 0 ? const Text("Categories") :const Text("Your Favourite"),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                gradient: LinearGradient(colors: [
                  Colors.pink,
                  Color.fromARGB(255, 86, 20, 42),
                  Color.fromARGB(255, 218, 30, 93)
                ])),
            child: TabBar(
                onTap: (value) {
                  setState(() {
                    globalvalue = value;
                
                  });
                },
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.pink,
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.category,
                    ),
                    child: Text(
                      'Categories',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.star,
                    ),
                    child: Text('Favourites',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ]),
          ),
          body: TabBarView(children: [const CategoryList(), favouritescreen(widget.favoritemeals)]),
        ));
  }
}
