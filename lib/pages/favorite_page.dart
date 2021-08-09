import 'package:flutter/material.dart';
import 'package:responsive/components/meal_item.dart';
import 'package:responsive/models/meal.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite';
  final List<Meal> favoriteMeals;
  FavoritePage(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
          child: Text('You have no favorites add yet. Try adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          favoriteMeals[index],
        ),
        itemCount: favoriteMeals.length,
        physics: BouncingScrollPhysics(),
      );
    }
  }
}
