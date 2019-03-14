import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/poi_bloc.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/widget/poi_list.dart';

class CategoryDetailPage extends Scaffold {
  CategoryDetailPage(Category category)
      : super(
          appBar: AppBar(
            title: Text(category.name),
          ),
          body: StreamBuilder<List<Poi>>(
            stream: poiBloc.allPois,
            builder: (context, snapshot) => Center(
                  child: snapshot.hasData
                      ? PoiList(snapshot.data)
                      : CircularProgressIndicator(),
                ),
          ),
        ) {
    poiBloc.fetchAllPois(category.id);
  }
}
