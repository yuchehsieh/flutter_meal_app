import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleFavorite, this.isFavoriteMeal);

  Widget buildSectionTitle(
    String titleText,
    BuildContext context,
    double height,
  ) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(
    double height,
    Widget child,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: height,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    final PreferredSizeWidget appBar = AppBar(
      title: Text('${selectedMeal.title}'),
    );

    final mediaQuery = MediaQuery.of(context);
    final double viewHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover, // important!
              ),
              height: viewHeight * 0.35,
              width: double.infinity,
            ),
            buildSectionTitle(
              'Ingredients',
              context,
              viewHeight * 0.03,
            ),
            buildContainer(
              viewHeight * 0.2,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(
              'Steps',
              context,
              viewHeight * 0.03,
            ),
            buildContainer(
              viewHeight * 0.2,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavoriteMeal(mealId)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        onPressed: () {
          toggleFavorite(mealId);
          // Navigator.of(context).canPop() && Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
