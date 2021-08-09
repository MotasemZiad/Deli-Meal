import 'package:flutter/material.dart';
import 'package:responsive/pages/filters_page.dart';
import 'package:responsive/pages/tabs_page.dart';
import 'package:responsive/utils/constants.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: drawerTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          buildListTile(
            icon: Icons.restaurant,
            label: 'Meals',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TabsPage.routeName);
            },
          ),
          buildListTile(
            icon: Icons.settings,
            label: 'Filter',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile({
    @required String label,
    @required IconData icon,
    @required Function onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: listTileTextStyle,
      ),
      trailing: Icon(
        Icons.arrow_right,
      ),
      onTap: onTap,
    );
  }
}
