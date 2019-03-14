import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/poi_bloc.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/widget/location_map.dart';

class PoiDetailPage extends StatelessWidget {
  final Poi _poi;

  PoiDetailPage(this._poi) : super() {
    poiBloc.fetchFavouriteIds();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Location Detail Page"),
        ),
        body: StreamBuilder<List<String>>(
          stream: poiBloc.favouriteIds,
          builder: (context, favourites) => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildHead(),
                    _buildBody(favourites)
                  ],
                ),
              ),
        ),
      );

  Image _buildHead() => Image.network(_poi.imageUrl);

  Padding _buildBody(AsyncSnapshot<List<String>> favourites) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTitle(favourites),
            _buildDescription(),
            _buildMap(),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      );

  Text _buildDescription() => Text(_poi.description);

  Row _buildTitle(AsyncSnapshot<List<String>> favourites) => Row(
        children: <Widget>[
          Text(
            _poi.name,
            style: TextStyle(
              color: Colors.red,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              poiBloc.putFavourite(
                  _poi.id, !favourites.data.contains(_poi.id));
              poiBloc.fetchFavouriteIds();
            },
            icon: Icon(
              favourites.hasData
                  ? favourites.data.contains(_poi.id)
                      ? Icons.star
                      : Icons.star_border
                  : Icons.close,
              color: Colors.red,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );

  Column _buildMap() => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 10.0),
            child: Text(
              "Map",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          LocationMap(_poi.markerLatPosition, _poi.markerLongPosition)
        ],
      );
}
