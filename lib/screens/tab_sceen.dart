import 'package:flutter/cupertino.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactos': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setAvailableMeals(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactos'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavoriteMeal(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  void _toggleFavoriteMeal(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text('Products'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_solid),
              title: Text('Favorite'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_filled),
              title: Text('Filter'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CategoriesScreen(
                  _availableMeals,
                  _toggleFavoriteMeal,
                  _isFavoriteMeal,
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: FavoriteScreen(
                    _favoriteMeal,
                    _toggleFavoriteMeal,
                    _isFavoriteMeal,
                  ),
                );
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return FiltersScreen(_filters, _setAvailableMeals);
              });
          }
        });
  }
}
