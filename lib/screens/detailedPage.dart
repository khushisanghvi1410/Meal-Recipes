import 'package:flutter/material.dart';
import '../dummy_data/meals_list.dart';

class DetailedPage extends StatelessWidget {
  final Function? togglefavorite;
  final Function isfavourite;
  DetailedPage(this.togglefavorite, this.isfavourite);

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final id = routeargs['id'];

    final meal = DUMMY_mealsDetailS.firstWhere((element) {
      return element.id == id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(meal.imageUrl))),
              const Text(
                "Ingredients",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(3),
                        color: Theme.of(context).canvasColor,
                        child: Text(
                          meal.ingredients[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ));
                  },
                ),
              ),
              const Text(
                "Steps",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(3),
                        color: Theme.of(context).canvasColor,
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              child: Text('#${index + 1}')),
                          title: Text(meal.steps[index]),
                        ));
                  },
                ),
              ),
FloatingActionButton(
        child: Icon(isfavourite(id) ? Icons.star : Icons.star_border),
        onPressed: (() {togglefavorite!(id);}),
      ),

            ]),
          ],
        ),
      ),
      
    );
  }
}
