import 'package:flutter/material.dart';
import 'package:responsive/components/main_drawer.dart';
import 'package:responsive/utils/constants.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FiltersPage({@required this.currentFilters, @required this.saveFilters});

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isVegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile({
    @required String title,
    @required String description,
    @required bool currentValue,
    @required Function onChanged,
  }) {
    return SwitchListTile.adaptive(
      value: currentValue,
      onChanged: onChanged,
      title: Text(
        title,
      ),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appName),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Meals filter saved successfully'),
                  backgroundColor: Colors.green,
                  duration: Duration(milliseconds: 2000),
                  behavior: SnackBarBehavior.floating,
                ));
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildSwitchListTile(
                        title: 'Gluten-Free',
                        description: 'Only include Gluten-Free meals.',
                        currentValue: _glutenFree,
                        onChanged: (newValue) {
                          setState(() {
                            _glutenFree = newValue;
                          });
                        }),
                    buildSwitchListTile(
                        title: 'Vegetarian',
                        description: 'Only include Vegetarian meals.',
                        currentValue: _isVegetarian,
                        onChanged: (newValue) {
                          setState(() {
                            _isVegetarian = newValue;
                          });
                        }),
                    buildSwitchListTile(
                        title: 'Vegan',
                        description: 'Only include Vegan meals.',
                        currentValue: _isVegan,
                        onChanged: (newValue) {
                          setState(() {
                            _isVegan = newValue;
                          });
                        }),
                    buildSwitchListTile(
                        title: 'Lactose-Free',
                        description: 'Only include Lactose-Free meals.',
                        currentValue: _lactoseFree,
                        onChanged: (newValue) {
                          setState(() {
                            _lactoseFree = newValue;
                          });
                        }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
