import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/category_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/widget/category_list.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    categoryBloc.fetchAllCategories();
    return StreamBuilder<List<Category>>(
        stream: categoryBloc.allCategories,
        builder: (context, category) {
          return Center(
            child: category.hasData
                ? CategoryList(category.data)
                : CircularProgressIndicator(),
          );
        });
  }
}
