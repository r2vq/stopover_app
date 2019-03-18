import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import 'package:stopover_app/bloc/poi_bloc.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/route/poi_detail_page.dart';
import 'package:stopover_app/styles.dart';
import 'package:stopover_app/widget/list_image_container.dart';
import 'package:stopover_app/widget/poi_tile.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    poiBloc.fetchFavouritePois();
    return StreamBuilder(
      stream: poiBloc.favouritePois,
      builder: (context, poisSnapshot) => Center(
            child: poisSnapshot.hasData
                ? _getSnapList(context, poisSnapshot.data)
                : CircularProgressIndicator(),
          ),
    );
  }

  Widget _getSnapList(BuildContext context, List<Poi> poiList) {
    final Size cardSize = Size(300.0, 600.0);
    return Semantics(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: SnapList(
          padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width - cardSize.width) / 2),
          sizeProvider: (index, data) => cardSize,
          separatorProvider: (index, data) => Size(10.0, 10.0),
          builder: (context, index, data) {
            return GestureDetector(
              onTap: () => _openPoiDetailPage(context, poiList[index]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: _getCard(poiList[index]),
              ),
            );
          },
          count: poiList.length,
        ),
      ),
    );
  }

  Widget _getCard(Poi poi) {
    return Container(
      child: Stack(
        children: <Widget>[
          ListImageContainer(poi.imageUrl, 600.0),
          _tileFooter(poi),
        ],
      ),
    );
  }

  Widget _tileFooter(Poi poi) {
    final PoiTile info = PoiTile(poi, 24.0, 16.0, Colors.red);
    final Container overlay = Container(
      height: 80.0,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: Styles.horizontalPaddingDefault,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[overlay],
    );
  }

  void _openPoiDetailPage(BuildContext context, Poi poi) {
    Navigator.push(
      context,
      MaterialPageRoute<PoiDetailPage>(
        builder: (BuildContext context) => PoiDetailPage(poi),
      ),
    );
  }
}
