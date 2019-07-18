import 'package:flutter/cupertino.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/widgets/category_item.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int _count = 0;

  void _addCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Favorite'),
      ),
      child: SafeArea(
        child: Center(
            child: Column(
          children: <Widget>[
            CupertinoButton(
              child: Icon(CupertinoIcons.share),
              onPressed: _addCount,
            ),
            Text(_count.toString()),
          ],
        )),
      ),
    );
  }
}
