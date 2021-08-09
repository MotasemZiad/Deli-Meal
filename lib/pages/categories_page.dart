import 'package:flutter/material.dart';
import 'package:responsive/components/category_item.dart';
import 'package:responsive/utils/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  static const routeName = '/categories';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 12.0,
        ),
        children: dummyCategories
            .map((e) => CategoryItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
      ),
    );
  }
}


// ? GridView.builder() approaches 
// GridView.builder(
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200.0,
//             childAspectRatio: 3 / 2,
//             mainAxisSpacing: 20.0,
//             crossAxisSpacing: 20.0,
//           ),
//           itemBuilder: (context, index) => CategoryItem(
//             title: dummyCategories[index].title,
//             color: dummyCategories[index].color,
//           ),
//           itemCount: dummyCategories.length,
//           physics: BouncingScrollPhysics(),
//         ) );