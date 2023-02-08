
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
    static const routeName="'/filterscreen'";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
      
            child: Text('Cook Up!'),
            alignment: Alignment.centerLeft,
            color: Color.fromARGB(118, 244, 224, 4),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title:const  Text('Categories'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              
            },
          ),
          ListTile(
            leading:const  Icon(Icons.settings),
            title:const  Text('Filters'),
             onTap: () {
              Navigator.of(context).pushReplacementNamed(routeName);
            },
          )
        ],
      ),
    );
  }
}
