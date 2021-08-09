import 'package:flutter/material.dart';

import 'package:responsive/models/meal.dart';
import 'package:responsive/pages/meal_detail_page.dart';
import 'package:responsive/utils/constants.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);
  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailPage.routeName,
      arguments: meal,
    );
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: BorderRadius.circular(radius),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 2.0,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  child: Container(
                    width: 320,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: marginVertical,
                    ),
                    child: Text(
                      meal.title,
                      style: mealTitleTextStyle,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        '${meal.duration} min',
                        textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
