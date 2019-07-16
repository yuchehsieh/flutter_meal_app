import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
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
          onPressed: () => showCupertinoAlertDialog(
            context: context,
            child: CupertinoAlertDialog(
              title: const Text('Discard draft?'),
              content: Column(
                children: const <Widget>[
                  Text('1'),
                  Text('0'),
                  Text('1'),
                  Text('0'),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Yes'),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context, 'Yes');
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('Discard'),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context, 'Discard');
                  },
                ),
              ],
            ),
          ),
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
