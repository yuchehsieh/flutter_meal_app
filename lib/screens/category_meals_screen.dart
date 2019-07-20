import 'package:flutter/cupertino.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final String categoryTitle;
  final String categoryId;
  final List<Meal> availableMeal;

  CategoryMealsScreen({
    @required this.categoryId,
    @required this.categoryTitle,
    @required this.availableMeal,
  });

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _categoryMeals;
  bool _loadedInitialData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitialData) return;

    _categoryMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(widget.categoryId);
    }).toList();

    _loadedInitialData = true;

    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;

    // final categoryTitle = routeArgs['categoryTitle'];
    // final categoryId = routeArgs['categoryId'];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.categoryTitle),
      ),
      child: SafeArea(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            affordability: _categoryMeals[index].affordability,
            complexity: _categoryMeals[index].complexity,
            duration: _categoryMeals[index].duration,
            imageUrl: _categoryMeals[index].imageUrl,
            title: _categoryMeals[index].title,
            removeItem: _removeItem,
          );
        },
        itemCount: _categoryMeals.length,
      )),
    );
  }
}
