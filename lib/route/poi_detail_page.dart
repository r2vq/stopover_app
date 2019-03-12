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
            body: Column(
              children: <Widget>[
                Image.network(poi.imageUrl),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        poi.name,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(poi.description),
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
