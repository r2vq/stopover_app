import 'package:flutter/material.dart';
import 'package:stopover_app/model/poi.dart';

const PoiTileHeight = 60.0;

class PoiTile extends StatelessWidget {
  final Poi poi;
  final double primaryFontSize;
  final double secondaryFontSize;
  final Color secondaryColor;

  PoiTile(this.poi, this.primaryFontSize, this.secondaryFontSize, this.secondaryColor);

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
                fontSize: primaryFontSize,
                color: Colors.white)
          ),
          Text(
              subTitle,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: secondaryFontSize,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor)
          ),
        ],
      ),
    );
  }
}