import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/category_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/widget/category_list.dart';

class Homepage extends MaterialApp {
  Homepage()
      : super(
          theme: ThemeData(
            primarySwatch: Colors.red
          ),
          home: StreamBuilder<List<Category>>(
              stream: categoryBloc.allCategories,
              builder: (context, category) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Category Screen"),
                  ),
                  body: Center(
                    child: category.hasData
                        ? CategoryList(category.data)
                        : Text("no data"),
                  ),
                );
              }),
        );
}
