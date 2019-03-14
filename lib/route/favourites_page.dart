import 'package:flutter/material.dart';
import 'package:stopover_app/bloc/poi_bloc.dart';
import 'package:stopover_app/widget/poi_list.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    poiBloc.fetchFavouritePois();
    return StreamBuilder(
      stream: poiBloc.favouritePois,
      builder: (context, poisSnapshot) => Center(
            child: poisSnapshot.hasData
                ? PoiList(poisSnapshot.data)
                : CircularProgressIndicator(),
          ),
    );
  }
}
