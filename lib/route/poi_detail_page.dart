import 'package:flutter/material.dart';
import 'package:stopover_app/model/poi.dart';

class PoiDetailPage extends MaterialApp {
  PoiDetailPage(Poi poi)
      : super(
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Location Detail Page"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.network(poi.imageUrl),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              poi.name,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        Text(poi.description),
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
                        Image.network(poi.mapUrl),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(16.0),
                  ),
                ],
              ),
            ),
          ),
        );
}
