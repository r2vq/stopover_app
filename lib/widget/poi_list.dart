import 'package:flutter/material.dart';
import 'package:stopover_app/model/category.dart';
import 'package:stopover_app/model/poi.dart';

class PoiList extends StatelessWidget {
  final List<Poi> _pois;

  PoiList(this._pois);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _createCard(_pois[index]);
      },
      itemCount: _pois.length,
    );
  }

  Widget _createCard(Poi poi) {
    return Card(
        child: Stack(
      children: <Widget>[
        Image.network(poi.imageUrl),
        Row(
          children: <Widget>[
            Text(
              poi.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
