import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future showCupertinoAlertDialog({BuildContext context, Widget child}) async {
    final dynamic result = await showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('DeliMeal'),
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.collections_solid),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((category) {
            return CategoryItem(
              id: category.id,
              title: category.title,
              color: category.color,
            );
          }).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
