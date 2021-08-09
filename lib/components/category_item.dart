import 'package:flutter/material.dart';
import 'package:responsive/pages/category_meals_page.dart';
import 'package:responsive/utils/constants.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({this.id, @required this.title, @required this.color});

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(context, CategoryMealsPage.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          title,
          style: categoryTitleTextStyle,
        ),
      ),
    );
  }
}
