import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/category_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/widget/category_list.dart';

class HomepageRoute extends MaterialApp {
  HomepageRoute()
      : super(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder<List<Category>>(
              stream: bloc.allCategories,
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
