import 'package:flutter/cupertino.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
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
              icon: Icon(CupertinoIcons.search),
              title: Text('Search'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: CategoriesScreen(),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: FavoriteScreen(),
                );
              });
          }
        });
  }
}
