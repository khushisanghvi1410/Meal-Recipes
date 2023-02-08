import 'package:flutter/material.dart';
import 'package:meals_recipe/models/meals_detail.dart';
import '../dummy_data/meals_list.dart';

class MealsCard extends StatelessWidget {

  final imageUrl;
  final affordability;
  var complexity;
  String title;
  final duration;
  String id;
  List<String> ingrediants;
  List<String> steps;
  

  MealsCard({
      
      required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.title,
      required this.duration,
      required this.id,
      required this.ingrediants,
      required this.steps,
      });
  // String? deleteid;

  

  static const routeName = '/detailedPage';
  void detailedpage(BuildContext ctx) {
    Navigator.pushNamed(ctx, routeName, arguments: {
      "id": id,
      "name": title,
      "ingrediants": ingrediants,
      "steps": steps
    }).then((value) {
     
    });
  }

  String get complexity1 {
    if (Complexity.Simple == complexity) {
      return 'Easy';
    } else if (Complexity.Hard == complexity) {
      return 'hard';
    } else if (Complexity.Challenging == complexity) {
      return 'Challenging';
    } else {
      return 'Unknown';
    }
  }

  String get affordability1 {
    if (Affordability.Affordable == affordability) {
      return 'Affordable';
    } else if (Affordability.Luxurious == affordability) {
      return 'Luxirious';
    } else if (Affordability.Pricey == affordability) {
      return 'Pricey';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 15,
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: () => detailedpage(context),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        top: 150,
                        left: 120,
                        child: Container(
                            color: Color.fromARGB(162, 0, 0, 0),
                            width: 220,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )))
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text(
                        '${duration} min',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text(
                        '$complexity1',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      Text(
                        "${affordability1}",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
