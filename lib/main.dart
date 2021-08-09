import 'package:flutter/material.dart';
import 'package:responsive/models/meal.dart';
import 'package:responsive/pages/category_meals_page.dart';
import 'package:responsive/pages/filters_page.dart';
import 'package:responsive/pages/meal_detail_page.dart';
import 'package:responsive/pages/not_found_page.dart';
import 'package:responsive/pages/tabs_page.dart';
import 'package:responsive/utils/constants.dart';
import 'package:responsive/utils/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    bool isFavorite = _favoriteMeals.any((element) => element.id == id);
    print(isFavorite);
    return isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorPrimary,
        canvasColor: Color.fromRGBO(255, 255, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: TabsPage.routeName,
      routes: {
        TabsPage.routeName: (context) => TabsPage(
              _favoriteMeals,
            ),
        CategoryMealsPage.routeName: (context) => CategoryMealsPage(
              availableMeals: _availableMeals,
            ),
        MealDetailPage.routeName: (context) => MealDetailPage(
              _toggleFavorites,
              _isMealFavorite,
            ),
        FiltersPage.routeName: (context) => FiltersPage(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   print(settings.name);
      //   return MaterialPageRoute(
      //     builder: (context) => CategoriesPage(),
      //   );
      // },
      // ! we use onUnknownRoute when we can't access this route from the routes above
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}
