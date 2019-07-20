import 'package:flutter/cupertino.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function toggleFavoriteMeal;
  final Function isFavoriteMeal;

  FavoriteScreen(
      this.favoriteMeals, this.toggleFavoriteMeal, this.isFavoriteMeal);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Your Favorite Meal'),
      ),
      child: SafeArea(
        child: Center(
          child: favoriteMeals.isEmpty
              ? Text(
                  'You have no favorite meal yet, go add some',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle,
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(
                      id: favoriteMeals[index].id,
                      affordability: favoriteMeals[index].affordability,
                      complexity: favoriteMeals[index].complexity,
                      duration: favoriteMeals[index].duration,
                      imageUrl: favoriteMeals[index].imageUrl,
                      title: favoriteMeals[index].title,
                      removeItem: null,
                      toggleFavoriteMeal: toggleFavoriteMeal,
                      isFavoriteMeal: isFavoriteMeal,
                    );
                  },
                  itemCount: favoriteMeals.length,
                ),
        ),
      ),
    );
  }
}

// int _count = 0;

//   void _addCount() {
//     setState(() {
//       _count += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Favorite'),
//       ),
//       child: SafeArea(
//         child: Center(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   CupertinoButton(
//                     child: Icon(CupertinoIcons.share),
//                     onPressed: _addCount,
//                   ),
//                   Text('Constraint - MaxHeight: ${constraints.maxHeight}'),
//                   Text('Device Height: ${MediaQuery.of(context).size.height}'),
//                   Text(_count.toString(),
//                       style: CupertinoTheme.of(context)
//                           .textTheme
//                           .navLargeTitleTextStyle),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
