import 'package:flutter/material.dart';
import 'package:meals_recipe/newwidgets/main_drawer.dart';

class Filterscreen extends StatefulWidget {
  final Function savefilters;
  Filterscreen(this.savefilters);

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

bool _glutenFree = false;
bool _vegeterian = false;
bool _vegan = false;
bool _lactoseFree = false;

class _FilterscreenState extends State<Filterscreen> {
  Widget _switchlisttile(String title, String subtitle,bool currentvalue, update ) {
    return SwitchListTile(
        activeColor: Color.fromARGB(255, 207, 173, 3),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        value: currentvalue,
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Your filters',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedfilters = {
                  'gluteen': _glutenFree,
                  
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian
                };
                print(selectedfilters);
                widget.savefilters(selectedfilters);
                Navigator.of(context).pushReplacementNamed('/');
              })
        ],
      ),






      body: Column(
        children: [
          const Text(
            "Adjust your meal Selection",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView(
              children: [
                _switchlisttile(
                    "Gluten-Free", "only gluten-free products", _glutenFree,
                    (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _switchlisttile(
                    "Lactose-Free", "only lactose-free products", _lactoseFree,
                    (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _switchlisttile(
                    "Vegeterian", "only vegeterian products", _vegeterian,
                    (value) {
                  setState(() {
                    _vegeterian = value;
                  });
                }),
                _switchlisttile("Vegen", "only gluten-vegen products", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
