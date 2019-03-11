import 'package:flutter/material.dart';
import 'package:stopover_app/model/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> _categories;

  CategoryList(this._categories);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _createCard(_categories[index]);
      },
      itemCount: _categories.length,
    );
  }

  Widget _createCard(Category category) {
    return Card(
        child: Stack(
      children: <Widget>[
        Image.network(category.imageUrl),
        Row(
          children: <Widget>[
            Text(
              category.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
