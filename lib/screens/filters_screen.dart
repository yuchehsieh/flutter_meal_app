import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactosFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool currentValue,
    @required Function onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  widget.saveFilters({
                    'gluten': _glutenFree,
                    'lactose': _lactosFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  });
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection!',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    title: 'Gluten-free',
                    subtitle: 'Only include gluten-free meals',
                    currentValue: _glutenFree,
                    onChanged: (bool value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Lactos-free',
                    subtitle: 'Only include lactos-free meals',
                    currentValue: _lactosFree,
                    onChanged: (bool value) {
                      setState(() {
                        _lactosFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vegetarian',
                    subtitle: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    onChanged: (bool value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vegan',
                    subtitle: 'Only include vegan meals',
                    currentValue: _vegan,
                    onChanged: (bool value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
