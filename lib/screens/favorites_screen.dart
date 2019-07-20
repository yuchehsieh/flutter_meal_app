import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Text(
          'You have no favorites yet - start adding some!',
        ),
      );
    }
    return Container(
        child: ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          duration: favoriteMeals[index].duration,
          imageUrl: favoriteMeals[index].imageUrl,
          title: favoriteMeals[index].title,
          removeItem: null,
        );
      },
      itemCount: favoriteMeals.length,
    ));
  }
}
