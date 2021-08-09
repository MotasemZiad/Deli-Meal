import 'package:flutter/material.dart';
import 'package:responsive/components/meal_item.dart';
import 'package:responsive/models/meal.dart';
import 'package:responsive/utils/constants.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsPage({this.availableMeals});

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isLoaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLoaded) {
      final arguments =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      final categoryId = arguments['id'];
      categoryTitle = arguments['title'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: marginVertical, vertical: marginVertical),
          child: displayedMeals.length == 0
              ? Center(
                  child: Text(
                  'You don\'t have any meal yet.',
                  style: categoryTitleTextStyle,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) => MealItem(
                    displayedMeals[index],
                  ),
                  itemCount: displayedMeals.length,
                  physics: BouncingScrollPhysics(),
                ),
        ));
  }
}
