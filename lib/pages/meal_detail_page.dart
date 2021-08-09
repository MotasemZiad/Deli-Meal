import 'package:flutter/material.dart';
import 'package:responsive/models/meal.dart';
import 'package:responsive/utils/constants.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavoriteMeal;
  MealDetailPage(this.toggleFavorite, this.isFavoriteMeal);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                child: Image.network(
                  arguments.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: colorPrimary,
                      elevation: cardElevation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12.0),
                        child: Text(
                          arguments.ingredients[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: arguments.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        arguments.steps[index],
                      ),
                    ),
                    Divider(
                      color: colorPrimary.withOpacity(0.4),
                      indent: 100.5,
                      endIndent: 100.5,
                      thickness: 1.5,
                    )
                  ]),
                  itemCount: arguments.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: colorAccent,
          onPressed: () {
            toggleFavorite(arguments.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(isFavoriteMeal(arguments.id)
                    ? 'Meal Added to favorite successfully.'
                    : 'Meal removed from Favorite successfully'),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: Icon(
            Icons.favorite,
            color: isFavoriteMeal(arguments.id) ? Colors.red : Colors.white,
          )),
    );
  }

  Widget buildSectionTitle(BuildContext context, String label) {
    return Container(
      margin: EdgeInsets.only(top: marginVertical),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer({@required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      width: 300.0,
      height: 200.0,
      child: child,
    );
  }
}
