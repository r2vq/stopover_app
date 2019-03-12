import 'package:flutter/material.dart';
import 'package:stopover_app/model/poi.dart';

class PoiDetailPage extends StatefulWidget {
  final Poi _poi;

  PoiDetailPage(this._poi) : super();

  @override
  State<StatefulWidget> createState() {
    return PoiDetailPageState(_poi);
  }
}

class PoiDetailPageState extends State<PoiDetailPage> {
  final Poi _poi;

  bool isFavourite = false;

  PoiDetailPageState(this._poi);

  void onFavouriteClicked() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(_poi.imageUrl),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
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
                        onPressed: onFavouriteClicked,
                        icon: Icon(
                          isFavourite ? Icons.star : Icons.star_border,
                          color: Colors.red,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Text(_poi.description),
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
                  Image.network(_poi.mapUrl),
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
              padding: EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }
}
