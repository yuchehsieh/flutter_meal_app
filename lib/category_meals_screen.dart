import 'package:flutter/cupertino.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(categoryTitle),
      ),
      child: SafeArea(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      )),
    );
  }
}
