 import 'package:flutter/material.dart';

class ListImageContainer extends StatelessWidget {

  final String imageUrl;

  ListImageContainer(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    Image image;
    try {
      image = Image.network(imageUrl, fit: BoxFit.cover);
    } catch (e) {
      print("could not load image $imageUrl");
    }
    return Container(
      constraints: BoxConstraints.expand(height: 200.0),
      child: image,
    );
  }
}
