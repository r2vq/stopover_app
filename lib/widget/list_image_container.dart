 import 'package:flutter/material.dart';

class ListImageContainer extends StatelessWidget {

  final String imageUrl;
  final double height;

  ListImageContainer(this.imageUrl, this.height);

  @override
  Widget build(BuildContext context) {
    Image image;
    try {
      image = Image.network(imageUrl, fit: BoxFit.cover);
    } catch (e) {
      print("could not load image $imageUrl");
    }
    return Container(
      constraints: BoxConstraints.expand(height: height),
      child: image,
    );
  }
}
