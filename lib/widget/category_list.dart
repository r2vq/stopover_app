import 'package:flutter/material.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/route/category_detail_page.dart';
import 'package:stopover_app/styles.dart';
import 'package:stopover_app/widget/category_tile.dart';
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
    return Semantics(
      child: GestureDetector(
        onTap: () => openCategoryDetailPage(context, category),
        child: Card(
          child: Container(
            height: 200.0,
            child: Stack(
              children: <Widget>[
                ListImageContainer(category.imageUrl),
                _tileFooter(category)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tileFooter(Category category) {
    final info = CategoryTile(category);
    final overlay = Container(
      height: 80.0,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: Styles.horizontalPaddingDefault,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[overlay],
    );
  }

  openCategoryDetailPage(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailPage(category),
      ),
    );
  }
}
