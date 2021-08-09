import 'package:flutter/material.dart';
import 'package:responsive/components/main_drawer.dart';
import 'package:responsive/models/meal.dart';
import 'package:responsive/pages/categories_page.dart';
import 'package:responsive/pages/favorite_page.dart';
import 'package:responsive/utils/constants.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/';
  final List<Meal> favoriteMeals;
  TabsPage(this.favoriteMeals);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritePage(widget.favoriteMeals),
        'title': 'Favorite',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: colorPrimary,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: _pages[_selectedPageIndex]['title'],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: _pages[_selectedPageIndex]['title'],
          ),
        ],
      ),
    );
  }
}
