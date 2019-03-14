import 'package:flutter/material.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/route/poi_detail_page.dart';
import 'package:stopover_app/styles.dart';
import 'package:stopover_app/widget/list_image_container.dart';
import 'package:stopover_app/widget/poi_tile.dart';

class PoiList extends StatelessWidget {
  final List<Poi> _pois;

  PoiList(this._pois);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _createCard(context, _pois[index]);
      },
      itemCount: _pois.length,
    );
  }

  Widget _createCard(BuildContext context, Poi poi) {
    return GestureDetector(
      onTap: () => openPoiDetailPage(context, poi),
      child: Semantics(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: Card(
            child: Stack(
              children: <Widget>[
                ListImageContainer(poi.imageUrl),
                _tileFooter(poi),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tileFooter(Poi poi) {
    final info = PoiTile(poi);
    final overlay = Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: Styles.horizontalPaddingDefault),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[overlay],
    );
  }

  openPoiDetailPage(BuildContext context, Poi poi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PoiDetailPage(poi),
      ),
    );
  }
}
