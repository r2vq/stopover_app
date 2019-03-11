import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/poi_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/widget/poi_list.dart';

class CategoryDetailPage extends MaterialApp {
  CategoryDetailPage(Category category)
      : super(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder<List<Poi>>(
              stream: poiBloc.allPois,
              builder: (context, snapshot) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(category.name),
                  ),
                  body: Center(
                    child: snapshot.hasData
                        ? PoiList(snapshot.data)
                        : Text("no data"),
                  ),
                );
              }),
        ) {
    poiBloc.fetchAllPois(category.id);
  }
}
