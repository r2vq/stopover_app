import 'package:flutter/material.dart';
import 'package:stopover_app/model/poi.dart';
import 'package:stopover_app/styles.dart';

const PoiTileHeight = 60.0;

class PoiTile extends StatelessWidget {
  final Poi poi;

  PoiTile(this.poi);

  @override
  Widget build(BuildContext context) {
    final title = poi.name.toUpperCase();
    final subTitle = poi.discount.toUpperCase();

    return Container(
      height: PoiTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                color: Colors.white)
          ),
          Text(
              subTitle,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)
          ),
        ],
      ),
    );
  }
}