import 'package:flutter/cupertino.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text(
            'The Recipes For The category',
          ),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('The Recipes'),
      ),
    );
  }
}
