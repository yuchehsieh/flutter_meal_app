import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tab_sceen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'DeliMeals',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      // home: CategoriesScreen(),
      // initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
