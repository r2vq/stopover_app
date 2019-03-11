import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/category_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/widget/category_list.dart';

class Homepage extends MaterialApp {
  Homepage()
      : super(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder<List<Category>>(
              stream: categoryBloc.allCategories,
              builder: (context, snapshot) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Category Screen"),
                  ),
                  body: Center(
                    child: snapshot.hasData
                        ? CategoryList(snapshot.data)
                        : Text("no data"),
                  ),
                );
              }),
        );
}
