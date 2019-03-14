import 'package:flutter/material.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/styles.dart';

const CategoryTileHeight = 100.0;

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    final title = category.name.toUpperCase();

    return Container(
      padding: EdgeInsets.all(0.0),
      height: CategoryTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Styles.locationTileTitleDark
          ),
        ],
      ),
    );
  }
}