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
              title: Text(poi.name),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Text("Hello world!"),
                ],
              ),
            ),
          ),
        );
}
