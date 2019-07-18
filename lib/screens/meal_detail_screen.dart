import 'package:flutter/cupertino.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Meal Detail - $mealId'),
      ),
      child: SafeArea(
        child: Text('Hello world'),
      ),
    );
  }
}
