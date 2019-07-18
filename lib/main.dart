import 'package:flutter/material.dart';
import 'package:meals_app/screens/tab_screen.dart';

import './screens/categories_screen.dart';
import './screens//category_meals_screen.dart';
import './screens//meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if(settings.name == '/category-meals') {
        //   ....
        //   return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
        // }
        // return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {
        // like 404 page in the web
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
    );
  }
}
