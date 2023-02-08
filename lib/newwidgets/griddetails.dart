import 'package:flutter/material.dart';
import 'package:meals_recipe/dummy_data/category_data.dart';
import 'package:meals_recipe/screens/meals.dart';

class GridDetails extends StatelessWidget {
  String id;
  String name;
  Color color;
  GridDetails(this.id, this.name, this.color);
  static const routename="/meals";

  @override
  void nextpage(BuildContext ctx){
    Navigator.pushNamed(ctx, routename,arguments: {"id":id,"name":name});
    // Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>Meals(id, name)
    // ) )
  }
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>nextpage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Container(
            padding: EdgeInsets.all(15),
            child: Text(name,
                style: TextStyle(
                  fontFamily: "Raleway",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
      ),
    );
  }
}
