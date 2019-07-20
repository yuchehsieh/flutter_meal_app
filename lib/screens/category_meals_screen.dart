import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

// import '../widgets//meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categoryMeals;
  String categoryId;
  String categoryTitle;
  bool _loadedInitData = false;

  @override
  void initState() {
    // something related to ModalRoute.of(context)
    // would not doing right here.
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData) return;
    final Map<String, String> routeArgs =
        ModalRoute.of(context).settings.arguments;
    categoryTitle = routeArgs['categoryTitle'];
    categoryId = routeArgs['categoryId'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              removeItem: _removeItem,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
