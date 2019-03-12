import 'package:flutter/material.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/route/category_detail_page.dart';
import 'package:stopover_app/widget/list_image_container.dart';

class CategoryList extends StatelessWidget {
  final List<Category> _categories;

  CategoryList(this._categories);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _createCard(context, _categories[index]);
      },
      itemCount: _categories.length,
    );
  }

  Widget _createCard(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () => openCategoryDetailPage(context, category),
      child: Card(
        child: Stack(
          children: <Widget>[
            ListImageContainer(category.imageUrl),
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
      ),
    );
  }

  openCategoryDetailPage(BuildContext context, Category category) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryDetailPage(category);
    }));
  }
}
