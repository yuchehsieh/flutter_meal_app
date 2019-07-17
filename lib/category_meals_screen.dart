import 'package:flutter/cupertino.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(categoryTitle),
      ),
      child: SafeArea(
        child: Center(
          child: const Text(
            'The Recipes For The category',
          ),
        ),
      ),
    );
  }
}
