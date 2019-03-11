// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/category_bloc.dart';
import 'package:stopover_app/model/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllCategories();
    return MaterialApp(
      title: 'Flutter Code Sample for material.Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<List<Category>>(
          stream: bloc.allCategories,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Hello world"),
              ),
              body: Center(
                child: snapshot.hasData ? Text(snapshot.data[0].name) : Text("no data"),
              ),
            );
          }),
    );
  }
}