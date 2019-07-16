import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'DeliMeals',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: CategoriesScreen(),
    );
  }
}
