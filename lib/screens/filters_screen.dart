import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function saveFiltersData;

  FiltersScreen(this.filters, this.saveFiltersData);

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
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactosFree = widget.filters['lactos'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool currentValue,
    @required Function onChanged,
    @required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navActionTextStyle
                        .copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                  ),
                ],
              ),
              CupertinoSwitch(
                onChanged: onChanged,
                value: currentValue,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Your Filters'),
          trailing: CupertinoButton(
            child: Icon(CupertinoIcons.shuffle_medium),
            onPressed: () {
              widget.saveFiltersData({
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactos': _lactosFree,
              });
            },
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection!',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle,
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
                      context: context,
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
                      context: context,
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
                      context: context,
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
                      context: context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
