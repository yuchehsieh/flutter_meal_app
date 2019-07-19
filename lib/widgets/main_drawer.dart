import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({
    String title,
    Function onTap,
    IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            height: 120,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 20),
          buildListTile(
            title: 'Meals',
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: Icons.restaurant,
          ),
          buildListTile(
            title: 'Filters',
            onTap: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
